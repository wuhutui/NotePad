package com.ysq.controlle;

import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
@RestControllerAdvice
public class ProjectExeptionAdvice {
    @ExceptionHandler(Exception.class)
    public Result doExepion(Exception exception){
        System.out.println(exception);
        return new Result("异常",500,"异常");
    }

}
