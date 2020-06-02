package Team.project;

import javax.sql.DataSource;
import org.apache.ibatis.logging.LogFactory;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;


@Configuration
@MapperScan("Team.project.dao")
public class MybatisConfig {

  static Logger logger = LogManager.getLogger(MybatisConfig.class);

  public MybatisConfig() {
    logger.debug("MybatisConfig 객체 생성!");
  }


  @Bean
  public SqlSessionFactory sqlSessionFactory(DataSource dataSource, // DB 커넥션풀
      ApplicationContext appCtx // Spring IoC 컨테이너
  ) throws Exception {

    // Mybatis의 log4j2 활성화시키기
    LogFactory.useLog4J2Logging();

    // Spring IoC 컨테이너 용으로 mybatis 측에서 따로 제작한
    // SqlSessionFactory 이다.
    SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
    sqlSessionFactoryBean.setDataSource(dataSource);
    sqlSessionFactoryBean.setTypeAliasesPackage("Team.project.domain");
    sqlSessionFactoryBean.setMapperLocations(//
        // Spring IoC 컨테이너를 통해 SQL 맵퍼 파일의 위치 정보를 가져온다.
        appCtx.getResources("classpath:Team/project/mapper/*Mapper.xml"));
    return sqlSessionFactoryBean.getObject();
  }
}


