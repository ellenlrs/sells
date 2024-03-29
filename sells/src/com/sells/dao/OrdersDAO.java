package com.sells.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.HibernateException;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Example;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.sells.common.util.PageControl;
import com.sells.search.OrdersSearch;

/**
 * Data access object (DAO) for domain model class Orders.
 * 
 * @see com.sells.dao.Orders
 * @author MyEclipse - Hibernate Tools
 */
public class OrdersDAO extends HibernateDaoSupport {
  private static final Log log = LogFactory.getLog(OrdersDAO.class);
  // property constants
  public static final String SELLS_NO = "sellsNo";
  public static final String ORDER_DT = "orderDt";
  public static final String IP = "ip";
  public static final String NAME = "name";
  public static final String EMAIL = "email";
  public static final String TEL = "tel";
  public static final String MOBILE = "mobile";
  public static final String ZIP = "zip";
  public static final String ADDRESS = "address";

  protected void initDao() {
    // do nothing
  }

  public Orders save(Orders transientInstance) {
    log.debug("saving Orders instance");
    try {
      getHibernateTemplate().save(transientInstance);
      log.debug("save successful");
      return transientInstance;
    } catch (RuntimeException re) {
      log.error("save failed", re);
      throw re;
    }
  }

  public Orders update(Orders transientInstance) {
    log.debug("update Orders instance");
    try {
      getHibernateTemplate().update(transientInstance);
      log.debug("update successful");
      return transientInstance;
    } catch (RuntimeException re) {
      log.error("update failed", re);
      throw re;
    }
  }

  public void delete(Orders persistentInstance) {
    log.debug("deleting Orders instance");
    try {
      getHibernateTemplate().delete(persistentInstance);
      log.debug("delete successful");
    } catch (RuntimeException re) {
      log.error("delete failed", re);
      throw re;
    }
  }

  public Orders findById(java.lang.String id) {
    log.debug("getting Orders instance with id: " + id);
    try {
      Orders instance = (Orders) getHibernateTemplate().get(
          "com.sells.dao.Orders", id);
      return instance;
    } catch (RuntimeException re) {
      log.error("get failed", re);
      throw re;
    }
  }

  public List findByExample(Orders instance) {
    log.debug("finding Orders instance by example");
    try {
      List results = getSession().createCriteria("com.sells.dao.Orders")
          .add(Example.create(instance)).list();
      log.debug("find by example successful, result size: " + results.size());
      return results;
    } catch (RuntimeException re) {
      log.error("find by example failed", re);
      throw re;
    }
  }

  public List findByProperty(String propertyName, Object value) {
    log.debug("finding Orders instance with property: " + propertyName
        + ", value: " + value);
    try {
      String queryString = "from Orders as model where model." + propertyName
          + "= ?";
      return getHibernateTemplate().find(queryString, value);
    } catch (RuntimeException re) {
      log.error("find by property name failed", re);
      throw re;
    }
  }

  public List findOrderReport(final String sellsNo, final String startDt,
      final String endDt, final String[] orderSt, final String[] cols,
      final String sort) {
    return getHibernateTemplate().executeFind(new HibernateCallback() {
      public Object doInHibernate(Session session) throws HibernateException,
          SQLException {
        StringBuffer sb = new StringBuffer();
        StringBuffer groupby = new StringBuffer();
        StringBuffer orderby = new StringBuffer();
        sb.append("select ");
        // if (null == orderSt || orderSt.length == 0) { // 使用全選
        if (null == cols || cols.length == 0) { // 使用所有欄位
          sb.append(" a.order_st,b.item_no,b.item_nm,a.member_no,a.name,date_format(a.order_dt,'%Y%m'),count(a.member_no) ");
          groupby
              .append(" a.order_st,b.item_no,b.item_nm,a.member_no,a.name,date_format(a.order_dt,'%Y%m') ");
          orderby
              .append(" a.order_st asc ,b.item_no,b.item_nm,a.member_no,a.name,date_format(a.order_dt,'%Y%m'),sum(b.price*b.qty) desc, count(a.member_no) desc ");
        } else {
          for (int i = 0; i < cols.length; i++) {
            if (i > 0) {
              sb.append(",");
              if (!cols[i].startsWith("count")) {
                groupby.append(",");
              }
            }
            sb.append(cols[i]);
            if (!cols[i].startsWith("count")) {
              groupby.append(cols[i]);
            }
          }
        }
        if ("1".equals(sort)) {
          orderby.append(" sum(b.price*b.qty) desc, count(a.member_no) desc ");
        }
        if ("2".equals(sort)) {
          orderby.append(" count(a.member_no) desc,sum(b.price*b.qty) desc ");
        }
        sb.append(" ,sum(b.PRICE*b.QTY) ");
        sb.append("from ORDERS_ITEM b,ORDERS a ");
        sb.append("where a.ORDER_NO = b.order_no and ");
        sb.append("a.sells_no = :sellsNo and ");
        sb.append("date_format(a.order_dt,'%Y%m%d') >= :startDt and ");
        sb.append("date_format(a.order_dt,'%Y%m%d') <= :endDt and ");
        sb.append("a.order_st in (:orderSt) ");
        sb.append(" group by ").append(groupby.toString());
        sb.append(" ORDER BY ").append(orderby.toString());
        log.info("sql:" + sb.toString());
        Query query = session.createSQLQuery(sb.toString());
        query.setString("sellsNo", sellsNo);
        query.setString("startDt", startDt);
        query.setString("endDt", endDt);
        if (null == orderSt || orderSt.length == 0) { // 使用全選
          query.setParameterList("order_st", new String[] { "00", "10", "20",
              "30", "99", "80", "85", "88" });
          // <label><input type="checkbox" name="orderSt" checked value="00"
          // />處理中</label>
          // <label><input type="checkbox" name="orderSt" checked value="10"
          // />出貨</label>
          // <label><input type="checkbox" name="orderSt" checked value="20"
          // />匯款已收到</label>
          // <label><input type="checkbox" name="orderSt" checked value="30"
          // />備貨中</label>
          // <label><input type="checkbox" name="orderSt" checked value="99"
          // />取消</label>
          // <label><input type="checkbox" name="orderSt" checked value="80"
          // />線上付款未完成</label>
          // <label><input type="checkbox" name="orderSt" checked value="85"
          // />線上付款成功</label>
          // <label><input type="checkbox" name="orderSt" checked value="88"
          // />線上付款失敗</label>
        } else {
          query.setParameterList("orderSt", orderSt);
        }
        List list = query.list();
        sb = null;
        return list;
      }
    });
  }

  public List findBySellsNo(Object sellsNo) {
    return findByProperty(SELLS_NO, sellsNo);
  }

  public List findByOrderDt(Object orderDt) {
    return findByProperty(ORDER_DT, orderDt);
  }

  public List findByIp(Object ip) {
    return findByProperty(IP, ip);
  }

  public List findByName(Object name) {
    return findByProperty(NAME, name);
  }

  public List findByEmail(Object email) {
    return findByProperty(EMAIL, email);
  }

  public List findByTel(Object tel) {
    return findByProperty(TEL, tel);
  }

  public List findByMobile(Object mobile) {
    return findByProperty(MOBILE, mobile);
  }

  public List findByZip(Object zip) {
    return findByProperty(ZIP, zip);
  }

  public List findByAddress(Object address) {
    return findByProperty(ADDRESS, address);
  }

  public Orders merge(Orders detachedInstance) {
    log.debug("merging Orders instance");
    try {
      Orders result = (Orders) getHibernateTemplate().merge(detachedInstance);
      log.debug("merge successful");
      return result;
    } catch (RuntimeException re) {
      log.error("merge failed", re);
      throw re;
    }
  }

  public void attachDirty(Orders instance) {
    log.debug("attaching dirty Orders instance");
    try {
      getHibernateTemplate().saveOrUpdate(instance);
      log.debug("attach successful");
    } catch (RuntimeException re) {
      log.error("attach failed", re);
      throw re;
    }
  }

  public void attachClean(Orders instance) {
    log.debug("attaching clean Orders instance");
    try {
      getHibernateTemplate().lock(instance, LockMode.NONE);
      log.debug("attach successful");
    } catch (RuntimeException re) {
      log.error("attach failed", re);
      throw re;
    }
  }

  public static OrdersDAO getFromApplicationContext(ApplicationContext ctx) {
    return (OrdersDAO) ctx.getBean("OrdersDAO");
  }

  // 查詢訂單基本資料
  public Orders getOrdersById(String ordersNo, String sellsNo, String memberNo) {
    log.debug("login Orders instance with property1: " + ordersNo + ", value: "
        + memberNo);
    log.debug("login Orders instance with property2: " + sellsNo + ", value: "
        + sellsNo);
    log.debug("login Orders instance with property3: " + memberNo + ", value: "
        + sellsNo);
    try {
      StringBuffer sb = new StringBuffer();
      sb.append("from Orders as model where ");
      if (StringUtils.isNotBlank(sellsNo)) {
        sb.append("model.sellsNo = :sellsNo and ");
      }
      if (StringUtils.isNotBlank(memberNo)) {
        sb.append("model.memberNo = :memberNo and ");
      }
      sb.append("model.orderNo = :ordersNo ");
      Query query = getSession().createQuery(sb.toString());
      if (StringUtils.isNotBlank(sellsNo)) {
        query.setString("sellsNo", sellsNo);
      }
      if (StringUtils.isNotBlank(memberNo)) {
        query.setString("memberNo", memberNo);
      }
      query.setString("ordersNo", ordersNo);
      Orders list = (Orders) query.list().get(0);
      return list;
    } catch (RuntimeException re) {
      log.error("find by property name failed", re);
      return null;
    }
  }

  public List findOrdersSearch(OrdersSearch search, PageControl control) {
    log.debug("finding Orders instance by Search");
    try {
      StringBuffer sql = new StringBuffer();
      sql.append("FROM Orders A WHERE 1=1 ");
      if (StringUtils.isNotBlank(search.getStartDt())) {
        sql.append(" AND date_format(A.orderDt,'%Y%m%d') >= :startDt ");
      }
      if (StringUtils.isNotBlank(search.getEndDt())) {
        sql.append(" AND date_format(A.orderDt,'%Y%m%d') <= :endDt ");
      }
      if (StringUtils.isNotBlank(search.getName())) {
        sql.append(" AND A.name like :name ");
      }
      if (StringUtils.isNotBlank(search.getOrderSt())) {
        sql.append(" AND A.orderSt = :orderSt ");
      }
      if (StringUtils.isNotBlank(search.getOrderNo())) {
        sql.append(" AND A.orderNo >= :orderNo ");
      }
      if (StringUtils.isNotBlank(search.getMemeberNo())) {
        sql.append(" AND A.memberNo = :memberNo ");
      }
      if (StringUtils.isNotBlank(search.getSellsNo())) {
        sql.append(" AND A.sellsNo = :sellsNo ");
      }
      // if (StringUtils.isNotBlank(control.getSortField())){
      // sql.append(" Order by ").append(control.getSortField()).append("
      // ").append(control.getAsc());
      // }
      sql.append(" Order by A.orderNo desc ");
      Query query = getSession().createQuery(sql.toString());
      if (StringUtils.isNotBlank(search.getStartDt())) {
        query.setString("startDt", search.getStartDt());
      }
      if (StringUtils.isNotBlank(search.getEndDt())) {
        query.setString("endDt", search.getEndDt());
      }
      if (StringUtils.isNotBlank(search.getName())) {
        query.setString("name", "%" + search.getName() + "%");
      }
      if (StringUtils.isNotBlank(search.getOrderSt())) {
        query.setString("orderSt", search.getOrderSt());
      }
      if (StringUtils.isNotBlank(search.getOrderNo())) {
        query.setString("orderNo", search.getOrderNo());
      }
      if (StringUtils.isNotBlank(search.getMemeberNo())) {
        query.setString("memberNo", search.getMemeberNo());
      }
      if (StringUtils.isNotBlank(search.getSellsNo())) {
        query.setString("sellsNo", search.getSellsNo());
      }
      if (control.getNowPage() != -1) {
        query.setFirstResult(control.getStartRow());
        query.setMaxResults(control.getShowrows());
      }
      List results = query.list();
      return results;
    } catch (RuntimeException re) {
      log.error("find by Orders failed", re);
      throw re;
    }
  }

  public int findOrdersSearchSize(OrdersSearch search) {
    log.debug("finding Orders size instance by Search");
    try {
      StringBuffer sql = new StringBuffer();
      sql.append("SELECT count(*) FROM Orders A WHERE 1=1 ");
      if (StringUtils.isNotBlank(search.getStartDt())) {
        sql.append(" AND date_format(A.orderDt,'%Y%m%d') >= '")
            .append(search.getStartDt()).append("' ");
      }
      if (StringUtils.isNotBlank(search.getEndDt())) {
        sql.append(" AND date_format(A.orderDt,'%Y%m%d') <= '")
            .append(search.getEndDt()).append("' ");
      }
      if (StringUtils.isNotBlank(search.getName())) {
        sql.append(" AND A.name like '%").append(search.getName())
            .append("%' ");
      }
      if (StringUtils.isNotBlank(search.getOrderSt())) {
        sql.append(" AND A.orderSt = '").append(search.getOrderSt())
            .append("' ");
      }
      if (StringUtils.isNotBlank(search.getOrderNo())) {
        sql.append(" AND A.orderNo >= '").append(search.getOrderNo())
            .append("' ");
      }
      if (StringUtils.isNotBlank(search.getMemeberNo())) {
        sql.append(" AND A.memberNo = '").append(search.getMemeberNo())
            .append("' ");
      }
      if (StringUtils.isNotBlank(search.getSellsNo())) {
        sql.append(" AND A.sellsNo = '").append(search.getSellsNo())
            .append("' ");
      }
      Object size = this.getHibernateTemplate().find(sql.toString()).get(0);
      sql.setLength(0);
      return Integer.parseInt(size.toString());
    } catch (RuntimeException re) {
      log.error("find by Orders size failed", re);
      throw re;
    }
  }
}