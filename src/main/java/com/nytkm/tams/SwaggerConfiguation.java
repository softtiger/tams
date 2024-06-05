package com.nytkm.tams;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.*;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spi.service.contexts.SecurityContext;
import springfox.documentation.spring.web.plugins.Docket;

import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/*
 * @author     chengYu
 * @date     2023/11/1
 * @describe
 */
@Configuration
public class SwaggerConfiguation {
    @Bean
    public Docket createRestfulApi() {
        return new Docket(DocumentationType.OAS_30)
                .groupName("认证和授权")
                .pathMapping("/")
                .apiInfo(apiInfo())
                .securityContexts(securityContext())
                .securitySchemes(Arrays.asList(apiKey()))
                .select()
                .apis(RequestHandlerSelectors.basePackage("com.nytkm.tams.auth.controllor")) //暴露接口地址的包路径
                .paths(PathSelectors.any())
                .build();
    }

    /**
     * 构建 api文档的详细信息函数,注意这里的注解引用的是哪个
     *
     * @return
     */
    private ApiInfo apiInfo() {
        return new ApiInfoBuilder()
                //页面标题
                .title("企业考勤系统SASS")
                //创建人
                .contact(new Contact("rainman", "http://www.infoq.com", "850491068@qq.com"))
                //版本号
                .version("1.0")
                //描述
                .description("API 描述")
                .build();
    }


    private ApiKey apiKey() {
        return new ApiKey("token", "token", "header");
    }



    @Bean
    public Docket orgApi() {
        return new Docket(DocumentationType.OAS_30)
                .groupName("组织管理")
                .pathMapping("/")
                .apiInfo(apiInfo())
                .securityContexts(securityContext())
                .securitySchemes(Arrays.asList(apiKey()))
                .select()
                .apis(RequestHandlerSelectors.basePackage("com.nytkm.tams.org.controllor")) //暴露接口地址的包路径
                .paths(PathSelectors.any())
                .build();
    }

    @Bean
    public Docket scheduleApi() {
        return new Docket(DocumentationType.OAS_30)
                .groupName("考勤设置")
                .directModelSubstitute(LocalTime.class, String.class)
                .pathMapping("/")
                .apiInfo(apiInfo())
                .securityContexts(securityContext())
                .securitySchemes(Arrays.asList(apiKey()))
                .select()
                .apis(RequestHandlerSelectors.basePackage("com.nytkm.tams.schedule.controllor")) //暴露接口地址的包路径
                .paths(PathSelectors.any())
                .build();
    }

    @Bean
    public Docket statisticsApi() {
        return new Docket(DocumentationType.OAS_30)
                .groupName("考勤统计")
                .directModelSubstitute(LocalTime.class, String.class)
                .pathMapping("/")
                .apiInfo(apiInfo())
                .securityContexts(securityContext())
                .securitySchemes(Arrays.asList(apiKey()))
                .select()
                .apis(RequestHandlerSelectors.basePackage("com.nytkm.tams.statistics.controllor")) //暴露接口地址的包路径
                .paths(PathSelectors.any())
                .build();
    }

    private List<SecurityContext> securityContext() {
        List<SecurityContext> securityContexts = new ArrayList<>();
        securityContexts.add(SecurityContext.builder().securityReferences(defaultAuth()).forPaths(PathSelectors.any()).build());
        return securityContexts;
    }

    List<SecurityReference> defaultAuth() {
        AuthorizationScope authorizationScope = new AuthorizationScope("global", "accessEverything");
        AuthorizationScope[] authorizationScopes = new AuthorizationScope[1];
        authorizationScopes[0] = authorizationScope;
        List<SecurityReference> securityReferences = new ArrayList<>();
        securityReferences.add(new SecurityReference("token", authorizationScopes));
        return securityReferences;
    }
}

