package com.sells.common.util;

import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.Properties;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.HibernateException;
import org.hibernate.MappingException;
import org.hibernate.dialect.Dialect;
import org.hibernate.engine.SessionImplementor;
import org.hibernate.id.Configurable;
import org.hibernate.id.PersistentIdentifierGenerator;
import org.hibernate.type.Type;
import org.hibernate.util.JDBCExceptionReporter;
import org.hibernate.util.PropertiesHelper;

/**
 * Hibernate ID 序號產生器
 * @author davide
 *
 */
public class HibernateSequenceIDGenerator implements
    PersistentIdentifierGenerator, Configurable {

  public static final String SEQUENCE = "sequence";

  public static final String PARAMETERS = "parameters";

  private String sequenceName;

  private String parameters;

  private Type type;

  private String sql;

  private String prefix;

  private String format;

  private static final Log log = LogFactory
      .getLog(HibernateSequenceIDGenerator.class);

  /* (non-Javadoc)
   * @see net.sf.hibernate.id.Configurable#configure(net.sf.hibernate.type.Type, java.util.Properties, net.sf.hibernate.dialect.Dialect)
   */
  public void configure(Type type, Properties params, Dialect dialect)
      throws MappingException {
    this.sequenceName = PropertiesHelper.getString(SEQUENCE, params,
        "hibernate_sequence");
    this.parameters = params.getProperty(PARAMETERS);
    String schemaName = params.getProperty(SCHEMA);
    if (schemaName != null && sequenceName.indexOf(".") < 0)
      sequenceName = schemaName + '.' + sequenceName;
    this.type = type;
    sql = dialect.getSequenceNextValString(sequenceName);
    prefix = params.getProperty("prefix") == null ? "" : params
        .getProperty("prefix");
    format = params.getProperty("format") == null ? null : params
        .getProperty("format");
  }

  /* (non-Javadoc)
   * @see net.sf.hibernate.id.IdentifierGenerator#generate(net.sf.hibernate.engine.SessionImplementor, java.lang.Object)
   */
  public Serializable generate(SessionImplementor session, Object obj)
      throws HibernateException{
    Serializable result = null;
    PreparedStatement st = null ;
    try {
      st = session.getBatcher().prepareStatement(sql); 
      ResultSet rs = st.executeQuery();
      rs.next();
      result = rs.getString(1);
      rs.close();
      if (format != null) {
        if (log.isDebugEnabled()) {
          log.debug("Sequence Format::" + format);
          log.debug("Sequence Next Result::" + result);
        }
        Integer inte = new Integer(result.toString());
        DecimalFormat dformat = new DecimalFormat(format);
        result = prefix + dformat.format(inte);
      } else {
        result = prefix + result;
      }
    } catch (SQLException sqle) {
      JDBCExceptionReporter.logExceptions(sqle);
    } finally {
      if ( st != null )
        try {
          session.getBatcher().closeStatement(st);
        } catch (SQLException e) {
          e.printStackTrace();
        }
    }
    if (log.isDebugEnabled())
      log.debug("Sequence identifier generated: " + result);
    return result;

  }

  /* (non-Javadoc)
   * @see net.sf.hibernate.id.PersistentIdentifierGenerator#sqlCreateStrings(net.sf.hibernate.dialect.Dialect)
   */
  public String[] sqlCreateStrings(Dialect dialect) throws HibernateException {
    String ddl[] = dialect.getCreateSequenceStrings(sequenceName);
//    if (parameters != null)
//      ddl += ' ' + parameters;
    return ddl ;
  }

  /* (non-Javadoc)
   * @see net.sf.hibernate.id.PersistentIdentifierGenerator#sqlDropString(net.sf.hibernate.dialect.Dialect)
   */
  public String[] sqlDropStrings(Dialect dialect) throws HibernateException {
    return dialect.getDropSequenceStrings(sequenceName);
  }

  /* (non-Javadoc)
   * @see net.sf.hibernate.id.PersistentIdentifierGenerator#generatorKey()
   */
  public Object generatorKey() {
    return sequenceName;
  }

}