package com.dal.dalgona;

import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

public class ServletInitial extends SpringBootServletInitializer{

   @Override
   protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
      // TODO Auto-generated method stub
      return builder.sources(DalgonaApplication.class);
   }
   
}