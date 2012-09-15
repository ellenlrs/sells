package com.sells.common.util;

import java.sql.Types;

import org.hibernate.Hibernate;
import org.hibernate.dialect.MySQLDialect;

public class IcartMySQLDialect extends MySQLDialect {
  public IcartMySQLDialect() {
    super();
    registerHibernateType(Types.DECIMAL, Hibernate.BIG_INTEGER.getName());
  }
}
