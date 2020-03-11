package com.idrica.skeleton.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

import com.idrica.skeleton.dto.HelloWorldDto;

@RefreshScope
@RestController
public class HelloController {

    private String defaultName;

    public HelloController(
        @Value("${skeleton.defaultName}") String defaultName
    ) {
        this.defaultName = defaultName;
    }

    @GetMapping(value = "/", produces = MediaType.APPLICATION_JSON_VALUE)
    public HelloWorldDto name(
        @RequestParam(name = "name", required = false) String name
    ) {
        if (name == null) {
            name = this.defaultName;
        }

        return HelloWorldDto
            .builder()
            .name(name)
            .build();
    }

}
