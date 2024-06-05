package com.nytkm.tams.tools;

import com.nimbusds.jose.*;
import com.nimbusds.jose.crypto.RSASSASigner;
import com.nimbusds.jose.crypto.RSASSAVerifier;
import com.nimbusds.jose.jwk.RSAKey;
import com.nimbusds.jwt.JWTClaimsSet;
import com.nimbusds.jwt.SignedJWT;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.security.rsa.crypto.KeyStoreKeyFactory;

import java.security.KeyPair;
import java.security.interfaces.RSAPrivateKey;
import java.security.interfaces.RSAPublicKey;
import java.text.ParseException;
import java.util.Date;
import java.util.Map;
import java.util.concurrent.TimeUnit;

public class JWTTools {
    private static final Logger logger = LoggerFactory.getLogger(JWTTools.class);

    private static RSAKey RSAKEY;

    //keyStore 密钥
    private static String secrect="rsajwt";

    private static JWSSigner JWS_SIGNER;

    static {
        //从文件中获取RSA密钥对
        KeyStoreKeyFactory keyStoreKeyFactory = new KeyStoreKeyFactory(new ClassPathResource("jwt.jks"),secrect.toCharArray());
        KeyPair keyPair = keyStoreKeyFactory.getKeyPair("jwt",secrect.toCharArray());

        //获取RSA 公钥
        RSAPublicKey publicKey = (RSAPublicKey) keyPair.getPublic();
        //获取RSA 私钥
        RSAPrivateKey privateKey = (RSAPrivateKey) keyPair.getPrivate();

        RSAKEY = new RSAKey.Builder(publicKey).privateKey(privateKey).build();

        //
        try {
            JWS_SIGNER = new RSASSASigner(RSAKEY,true);
        } catch (JOSEException e) {
            logger.error("RSA 签名对象生成错误" ,e);
        }
    }


    /**
     *
     * @param duration   token 有效期
     * @param timeUnit   有效期的单位
     * @param payLoad    token负载
     * @return
     */
    public static String  genToken(long duration, TimeUnit timeUnit, Map<String,Object> payLoad){
        // Prepare JWT with claims set
        JWTClaimsSet claimsSet = new JWTClaimsSet.Builder()
                .subject("jwt.study")
                .issuer("https://revoke.person")
                .expirationTime(new Date(new Date().getTime() + TimeUnit.MILLISECONDS.convert(duration,timeUnit)))
                .claim("account",payLoad.get("account"))
                .claim("nickName",payLoad.get("nickName"))
                .claim("uid",payLoad.get("uid"))
                .build();

         SignedJWT signedJWT = new SignedJWT(new JWSHeader(JWSAlgorithm.RS256), claimsSet);

        //用RSA 签名
        try {
            signedJWT.sign(JWS_SIGNER);
        } catch (JOSEException e) {
            logger.error("生成token时签名错误",e);
            throw new SecurityException("生成token时签名错误",e);
        }
        String token = signedJWT.serialize();
        return token;
    }



    public static boolean verify(String token){
        try {
            SignedJWT signedJWT = SignedJWT.parse(token);

            RSAKey publicRsaKey = RSAKEY.toPublicJWK();

            JWSVerifier verifier = new RSASSAVerifier(publicRsaKey);

            if (signedJWT.verify(verifier)) {
                if (signedJWT.getJWTClaimsSet().getExpirationTime().before(new Date())) {
                    logger.warn("token{} 已过期",token);
                    return false;
                } else {
                    return  true;
                }
            } else {
                logger.warn("无效签名,token:{}",token);
                throw new  SecurityException("无效签名");
            }
        } catch (ParseException | JOSEException e) {
            logger.warn("无效token:{}",token);
            throw new SecurityException("无效token",e);
        }
    }
}
