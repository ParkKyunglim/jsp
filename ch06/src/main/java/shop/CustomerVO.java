package shop;

import java.sql.Date;

public class CustomerVO {
	
	private String CustId;
	private String name;
	private String hp;
	private String addr;
	private Date rdate;
	
	public String getCustId() {
		return CustId;
	}
	public void setCustId(String custId) {
		CustId = custId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public Date getRdate() {
		return rdate;
	}
	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}
	
	@Override
	public String toString() {
		return "CustomerVO [CustId=" + CustId + ", name=" + name + ", hp=" + hp + ", addr=" + addr + ", rdate=" + rdate
				+ "]";
	}
	

}
