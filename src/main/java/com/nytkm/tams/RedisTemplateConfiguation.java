package com.nytkm.tams;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonTypeInfo;
import com.fasterxml.jackson.annotation.PropertyAccessor;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.*;
import com.fasterxml.jackson.databind.jsontype.TypeDeserializer;
import com.fasterxml.jackson.databind.jsontype.TypeSerializer;
import com.fasterxml.jackson.databind.jsontype.impl.LaissezFaireSubTypeValidator;
import com.fasterxml.jackson.databind.module.SimpleModule;
import com.fasterxml.jackson.datatype.jdk8.Jdk8Module;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import com.fasterxml.jackson.module.paramnames.ParameterNamesModule;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.Jackson2JsonRedisSerializer;
import org.springframework.data.redis.serializer.StringRedisSerializer;
import org.springframework.security.jackson2.CoreJackson2Module;
import org.springframework.security.jackson2.SecurityJackson2Modules;
import org.springframework.security.web.jackson2.WebJackson2Module;
import org.springframework.security.web.jackson2.WebServletJackson2Module;
import org.springframework.security.web.server.jackson2.WebServerJackson2Module;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Component
public class RedisTemplateConfiguation {

    @Bean
    public RedisTemplate<String,?> redisTemplate(RedisConnectionFactory redisConnectionFactory){
        RedisTemplate<String, ?> template = new RedisTemplate<>();
        template.setKeySerializer(new StringRedisSerializer());
        Jackson2JsonRedisSerializer valueSerializer =new Jackson2JsonRedisSerializer<Object>(Object.class);

        ObjectMapper om = new ObjectMapper();

        //指定要序列化的域，field,get和set,以及修饰符范围，ANY是都有包括private和?public
        om.setVisibility(PropertyAccessor.ALL, JsonAutoDetect.Visibility.ANY);
        // 指定序列化输入的类型，类必须是非final修饰的，final修饰的类，比如String,Integer等会跑出异常
        om.activateDefaultTyping(LaissezFaireSubTypeValidator.instance, ObjectMapper.DefaultTyping.NON_FINAL);

        ;
        SimpleModule simpleModule = new SimpleModule();
        simpleModule.addSerializer(Date.class, new JodaDateJsonSerializer());
        simpleModule.setMixInAnnotation(Date.class, JodaDateJsonDeserializer.class);
        simpleModule.addDeserializer(Date.class, new JodaDateJsonDeserializer());


        om.registerModule(simpleModule);
        //定制序列化
   //     om.addMixIn(CustomUser.class, CustomUserMixin.class);
        om.enableDefaultTyping(ObjectMapper.DefaultTyping.NON_FINAL, JsonTypeInfo.As.PROPERTY);
        om.disable(MapperFeature.AUTO_DETECT_SETTERS);
        om.disable(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS);
        om.registerModule(new Jdk8Module());
        om.registerModule(new JavaTimeModule());
        om.registerModule(new ParameterNamesModule());
        om.registerModule(new CoreJackson2Module());
        om.registerModule(new WebJackson2Module());
        om.registerModule(new WebServletJackson2Module());
        om.registerModule(new WebServerJackson2Module());
  //      om.addMixIn(CustomUser.class, CustomUserMixin.class);
        SecurityJackson2Modules.enableDefaultTyping(om);



        valueSerializer.setObjectMapper(om);
        template.setValueSerializer(valueSerializer);
        template.setConnectionFactory(redisConnectionFactory);
        return template;
    }

    class JodaDateJsonSerializer extends JsonSerializer<Date> {
        @Override
        public void serialize(Date date, JsonGenerator gen, SerializerProvider serializers) throws IOException {
            DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            gen.writeString(fmt.format(date));
        }
        @Override
        public void serializeWithType(Date date, JsonGenerator gen, SerializerProvider serializers, TypeSerializer typeSer)
                throws IOException {
            DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            gen.writeString(fmt.format(date));
        }
    }

    public class JodaDateJsonDeserializer extends JsonDeserializer<Date> {
        Logger logger = LoggerFactory.getLogger(JodaDateJsonDeserializer.class);

        @Override
        public Date deserialize(JsonParser p, DeserializationContext ctxt) throws IOException, JsonProcessingException {
            Date result = null;
            DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            try {
                result = fmt.parse(p.readValueAs(String.class));
            } catch (ParseException e) {
                logger.error("转换成日期时,错误" + e.getMessage(), e);
            }
            return result;
        }

        @Override
        public Date deserializeWithType(JsonParser p, DeserializationContext ctxt, TypeDeserializer typeDeserializer)
                throws IOException {
            Date result = null;
            DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            try {
                result = fmt.parse(p.readValueAs(String.class));
            } catch (ParseException e) {
                logger.error("转换成日期时错误" + e.getMessage(), e);
            }
            return result;
        }

    }

    }