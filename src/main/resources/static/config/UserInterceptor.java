package com.liaoin.microservice.consumer.platform.config;

import com.liaoin.common.jackson.JsonUtils;
import com.liaoin.common.jackson.Result;
import com.liaoin.microservice.consumer.platform.handler.GlobalExceptionHandler;
import com.liaoin.microservice.consumer.platform.security.JwtUtils;
import io.jsonwebtoken.Claims;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import static com.liaoin.common.util.Constants.AUTHORIZATION;
import static com.liaoin.common.util.Constants.CURRENT_USER_ID;

/**
 * @description:
 * @author: mc
 * @createDate: 2018/7/2 14:57
 * @updateRemark:
 * @version: 1.0
 */
@Component
public class UserInterceptor extends HandlerInterceptorAdapter {

    @Value("${USER_SESSION}")
    private String USER_SESSION;
    @Value("${USER_SESSION_TIME}")
    private Long USER_SESSION_TIME;

    @Autowired
    private StringRedisTemplate redisTemplate;
    private static Logger logger = LoggerFactory.getLogger(GlobalExceptionHandler.class);

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if (!(handler instanceof HandlerMethod)) {
            return true;
        }
        //TODO 上线的时候删除
        logger.info("访问了URL:" + request.getRequestURL());
        String token = request.getHeader(AUTHORIZATION);
        //boolean redisResult = redisTemplate.hasKey(USER_SESSION + ":" + token);
        //if (Optional.ofNullable(token).isPresent() && JWTTokenUtils.validateToken(token) && JWTTokenUtils.getUserId(token) != null && redisResult) {
        if (token != null) {
            Claims claims = JwtUtils.parseToken(token);
            Integer userId = claims.get("userId", Integer.class);
            request.setAttribute(CURRENT_USER_ID, userId);

            //request.setAttribute(CURRENT_USER_ID, JWTTokenUtils.getUserId(token));
            /*Long minValue = 2L;
            if (redisTemplate.getExpire(USER_SESSION + ":" + token) < minValue) {
                redisTemplate.expire(USER_SESSION + ":" + token, USER_SESSION_TIME, TimeUnit.MINUTES);
            }*/
            return true;

        }

        //response(response);

        return true;
    }


    /**
     * 返回错误信息
     */
    public void response(HttpServletResponse response) {
        PrintWriter out = null;
        try {
            response.setHeader("Access-Control-Allow-Origin", "*");
            response.setHeader("Cache-Control", "no-store");
            response.setHeader("Pragma", "no-cache");
            response.setContentType(MediaType.APPLICATION_JSON_VALUE);
            response.setCharacterEncoding("UTF-8");
            //response.sendError(200,"您已在其他地方登录");
            out = response.getWriter();
            out.write(JsonUtils.objectToJson(new Result(401, "认证失败,该账号可能已在其他地方登录", "")));
            out.flush();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {

            out.close();
        }

    }
}
