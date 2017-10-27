package com.newlecture.webapp.dao.spring;

import java.lang.reflect.ParameterizedType;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.transaction.support.TransactionCallback;
import org.springframework.transaction.support.TransactionCallbackWithoutResult;
import org.springframework.transaction.support.TransactionTemplate;

import com.mysql.jdbc.Driver;
import com.newlecture.webapp.dao.NoticeDao;
import com.newlecture.webapp.entity.Notice;
import com.newlecture.webapp.entity.NoticeView;

public class SpringNoticeDao implements NoticeDao {

   @Autowired
   private JdbcTemplate template;
//   원래는 아래것이 맞음
/*   @Autowired
   public void setTemplate(JdbcTemplate template) {
      this.template = template;
   }*/
   
   /*//트랜잭션 처리방법 1
   @Autowired
   private PlatformTransactionManager transactionManager;*/
   
   //트랜잭션 처리방법 2
  /* @Autowired
   private TransactionTemplate transactionTemplate;*/
   
   @Override
   public List<NoticeView> getList(int page, String field, String query) {
      /*String sql = "SELECT * FROM NoticeView where "+field+" like ? order by regDate desc limit ?, 10";

      List<NoticeView> list = template.query(sql, new Object[] {"'%"+query+"%'",(page-1)*10},
            BeanPropertyRowMapper.newInstance(NoticeView.class));// notice를 반환 시.requiredType에는 반환 값을 대입

      String sql = "SELECT * FROM NoticeView"+
               "where"+field+"like ?"+
               "order by regDate desc"+
               "limit ?, 10";
               
                 List<NoticeView> list =template.query( sql, new Object[]{"'%"+query+"%'", (page-1)*10},
                 BeanPropertyRowMapper.newInstance(NoticeView.class));
      return list;*/
         String sql = "select * from NoticeView" + 
                  "      where ? like ?" + 
                  "      order by regDate desc" + 
                  "      limit ?, 10";
            
            List<NoticeView> list = template.query(sql, new Object[] {"'%"+field+"%'","'%"+query+"%'", (page-1)*10}, BeanPropertyRowMapper.newInstance(NoticeView.class));
            
            return list;
   }

   @Override
   public int getCount() {
      // TODO Auto-generated method stub
      String sql = "select Count(id) 'count' from Notice";
      int count= template.queryForObject(
            sql,
            Integer.class);// notice를 반환 시.requiredType에는 반환 값을 대입
      return count;
   }

   @Override
   public NoticeView get(String id) {
      String sql = "select * from Notice where id=?";

      NoticeView notice = template.queryForObject(
    		  sql, 
    		  new Object[] {id},
    		  BeanPropertyRowMapper.newInstance(NoticeView.class));// notice를 반환 시.requiredType에는 반환 값을 대입
                                                                                                                            
      return notice;
   }

   @Override
   public int update(String id, String title, String content) {
      String sql="update Notice set title=?,content=? where id=?";
            int result = template.update(sql
                  ,title
                  ,content
                  ,id);
/*      int result = template.update(sql, new PreparedStatementSetter() {
         
         @Override
         public void setValues(PreparedStatement st) throws SQLException {
            // TODO Auto-generated method stub
            st.setString(1, title);
            st.setString(2, content);
            st.setString(3, id);
         }
      });*/

            
            return result;
   }

   @Override
   public NoticeView getPrev(String id) {
      // TODO Auto-generated method stub
      return null;
   }

   @Override
   public NoticeView getNext(String id) {
      // TODO Auto-generated method stub
      return null;
   }

   @Override
   public int insert(String title, String content, String writerId) {
      
      
      return insert(new Notice(title,content,writerId));
   }
   
  
   //트랜잭션 처리방법 3-AOP를 사용 + 처리방법 4(Annotation)
   @Override
   @Transactional(propagation = Propagation.REQUIRES_NEW)
   public int insert(Notice notice) {
      
      String sql="insert into Notice(id, title, content, writerId) values(?,?,?,?)";
      String sql1 = "update Member set point=point+1 where id=?";
      
      int result = 0;
      
      result += template.update(sql
		            , getNextId()
		            , notice.getTitle()
		            , notice.getContent()
		            , notice.getWriterId());


      result +=	template.update(sql1, notice.getWriterId());

      return result;
         
   }

/*   @Override
   public int insert(Notice notice) {
      //트랜잭션 처리방법 2
      String sql="insert into Notice(id, title, content, writerId) values(?,?,?,?)";
      String sql1 = "update Member set point=point+1 where id=?";
      
      int result = 0;
      
      result = (int) transactionTemplate.execute(new TransactionCallbackWithoutResult() {
		
		@Override
		protected void doInTransactionWithoutResult(TransactionStatus arg0) {
			
			 template.update(sql
		            , getNextId()
		            , notice.getTitle()
		            , notice.getContent()
		            , notice.getWriterId());

		   template.update(sql1, notice.getWriterId());
			
		}
	});
   
         return result;
         
   }*/
     
      
      //트랜잭션 처리방법 1 -트랜잭션 매니저 직접 이용
//      String sql="insert into Notice(id, title, content, writerId) values(?,?,?,?)";
//      String sql1 = "update Member set point=point+1 where id=?";
//      
//      DefaultTransactionDefinition def = new DefaultTransactionDefinition();
//      TransactionStatus state =  transactionManager.getTransaction(def);
//      
//      try {
//      int result = template.update(sql
//            ,getNextId()
//            ,notice.getTitle()
//            ,notice.getContent()
//            ,notice.getWriterId());
//      
//      //////////////////////////////////////////////////
//      result+= template.update(
//            sql1
//            ,notice.getWriterId());// notice를 반환 시.requiredType에는 반환 값을 대입
//      
//         transactionManager.commit(state);
//         
//         return result;
//      }
//      catch (Exception e) {
//         transactionManager.rollback(state);
//         throw e;
//      }
//      /*return 0;*/
//   }

   @Override
   public String getNextId() {
      String sql="select IFNULL(max(cast(id as unsigned)), 0)+1 from Notice";
      
      String result= template.queryForObject(
            sql,
            String.class);
      return result;
   }

}