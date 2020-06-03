package Team.project;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import Team.project.web.interceptor.RoomUserInterceptor;

@ComponentScan(value = "Team.project")
@EnableWebMvc
public class AppConfig implements WebMvcConfigurer {

  static Logger logger = LogManager.getLogger(AppConfig.class);

  @Autowired
  RoomUserInterceptor roomUserInterceptor;

  public AppConfig() {
    logger.debug("AppConfig 객체 생성!");
  }

  @Bean
  public MultipartResolver multipartResolver() {
    CommonsMultipartResolver mr = new CommonsMultipartResolver();
    mr.setMaxUploadSize(10000000);
    mr.setMaxInMemorySize(2000000);
    mr.setMaxUploadSizePerFile(5000000);
    return mr;
  }

  @Override
  public void addInterceptors(InterceptorRegistry registry) {
    registry.addInterceptor(roomUserInterceptor) //
        .addPathPatterns("/room/**");
  }

}
