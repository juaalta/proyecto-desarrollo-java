package com.idrica.skeleton.config;

import lombok.Getter;
import lombok.Setter;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

import javax.validation.constraints.NotBlank;

@Getter @Setter
@Configuration
@ConfigurationProperties(prefix = "skeleton")
public class SkeletonConfig {
    @NotBlank
    private String defaultName;
}
