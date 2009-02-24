package com.sells.common.util;

import java.io.Serializable;
import java.text.DecimalFormat;
import java.util.Properties;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.HibernateException;
import org.hibernate.dialect.Dialect;
import org.hibernate.engine.SessionImplementor;
import org.hibernate.id.TableGenerator;
import org.hibernate.type.Type;

/**
 * Hibernate ID 序號產生器
 * @author davide
 *
 */
public class HibernateIDGenerator extends TableGenerator {

  private String prefix;
  private String format;

  @SuppressWarnings("unused")
  private static final Log log = LogFactory.getLog(HibernateIDGenerator.class);

  /*
   * (non-Javadoc)
   * 
   * @see net.sf.hibernate.id.Configurable#configure(net.sf.hibernate.type.Type,
   *      java.util.Properties, net.sf.hibernate.dialect.Dialect)
   */
  public void configure(Type type, Properties params, Dialect d) {
    super.configure(type, params, d);
    prefix = params.getProperty("prefix") == null ? "" : params
        .getProperty("prefix");
    format = params.getProperty("format") == null ? null : params
        .getProperty("format");

  }

  /*
   * (non-Javadoc)
   * 
   * @see net.sf.hibernate.id.IdentifierGenerator#generate(net.sf.hibernate.engine.SessionImplementor,
   *      java.lang.Object)
   */
  public synchronized Serializable generate(SessionImplementor session,
      Object obj) throws HibernateException {
    Integer integer = (Integer) super.generate(session, obj);
    if (format != null) {
      DecimalFormat dformat = new DecimalFormat(format);
      return prefix + dformat.format(integer);
    } else {
      return prefix + integer;
    }

  }

}
