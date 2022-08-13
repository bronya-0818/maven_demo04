package com.zx.utils;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.InputStream;

/**
 * @author maple
 * @create 2022-07-05 17:07
 */
public class MyBatisUtil {
    //获得SqlSession工厂
    private static SqlSessionFactory factory;
    //创建ThreadLocal绑定当前线程中的SqlSession对象
    private static final ThreadLocal<SqlSession> THREAD_LOCAL = new ThreadLocal<SqlSession>();

    static {
        try {
            InputStream is = Resources.getResourceAsStream("mybatis-config.xml");
            factory = new SqlSessionFactoryBuilder().build(is);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //获得连接（从THREAD_LOCAL中获得当前线程SqlSession）
    private static SqlSession openSession(){
        SqlSession session = THREAD_LOCAL.get();
        if(session == null){
            session = factory.openSession();
            THREAD_LOCAL.set(session);
        }
        return session;
    }

    /**
     * 释放连接（释放当前线程中的SqlSession）
     */
    public static void closeSession(){
        SqlSession session = THREAD_LOCAL.get();
        session.close();
        THREAD_LOCAL.remove();
    }

    /**
     *  提交事务（提交当前线程中的SqlSession所管理的事务）
     */
    public static void commit(){
        SqlSession session = openSession();
        session.commit();
        closeSession();
    }

    /**
     * 回滚事务（回滚当前线程中的SqlSession所管理的事务）
     */
    public static void rollback(){
        SqlSession session = openSession();
        session.rollback();
        closeSession();
    }



    /**
     * 获得接口实现类对象
     * @param clazz 泛型对象
     * @param <T> 泛型
     * @return
     */
    public static <T> T getMapper(Class<T> clazz){
        SqlSession session = openSession();
        return session.getMapper(clazz);
    }

}
