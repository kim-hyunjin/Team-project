package Team.project;

import java.io.IOException;
import java.util.Properties;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;


@Configuration
public class MailConfig {

  static Logger logger = LogManager.getLogger(MailConfig.class);

  public MailConfig() throws IOException {
    MailConfig.logger.info("[MailConfig.java] :: constructor called");
  }


   
  @Bean
  public JavaMailSender mailSender() {
    JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
    Properties mailProperties = new Properties();
    mailProperties.put("mail.transport.protocol", "smtp");
    mailProperties.put("mail.smtp.auth", "true");
    mailProperties.put("mail.smtp.starttls.enable", "true");
    mailProperties.put("mail.smtp.debug", "true");

    mailSender.setJavaMailProperties(mailProperties);
    mailSender.setHost("smtp.gmail.com");
    mailSender.setPort(587);
    mailSender.setUsername("01049236753a@gmail.com");
    mailSender.setPassword("roal12455!!A");
    
    mailSender.setDefaultEncoding("utf-8");
    return mailSender;
  }
}
