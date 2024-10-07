package com.btoy.demo_docker_multistaging.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/demo")
public class DemoController {
    @GetMapping
    public ResponseEntity<String> demo(){
        return ResponseEntity.ok("Application started successfully!");
    }
}
