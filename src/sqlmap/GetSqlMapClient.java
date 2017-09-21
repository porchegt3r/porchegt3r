package sqlmap;

import java.io.IOException;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

public class GetSqlMapClient {
    private static SqlMapClient sqlMapClient;
    
    // 최초 1회만 실행되고 공유됨 
    static {
      try {
        Reader reader = Resources.getResourceAsReader("sqlmap/SqlMapConfig.xml");
        sqlMapClient = SqlMapClientBuilder.buildSqlMapClient(reader);
        reader.close(); 
      } catch (IOException e) {
        // Fail fast.
        throw new RuntimeException("Something bad happened while building the SqlMapClient instance." + e, e);
      }
    }
    
    public static SqlMapClient get(){
        return sqlMapClient;
    }
}

