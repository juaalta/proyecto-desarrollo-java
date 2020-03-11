package com.idrica.skeleton.dto;

import lombok.Builder;
import lombok.Data;

import javax.validation.constraints.NotBlank;

@Data
@Builder
public class HelloWorldDto {
    @NotBlank
    private String name;
}
