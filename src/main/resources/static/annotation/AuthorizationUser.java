package com.liaoin.pm.annotation;

import java.lang.annotation.*;

/**
 * @author mc
 * @version 1.0
 * @date 2018/9/25 15:29
 * @description
 */
@Target(ElementType.PARAMETER)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface AuthorizationUser {
	boolean required() default false;
}