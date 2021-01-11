package IA_Project.WebData;
import javax.persistence.Embeddable;

@Embeddable
public class Name implements java.io.Serializable {
	String fName;
	String mName;
	String lName;
	/**
	 * @param fName
	 * @param mName
	 * @param lName
	 */
	public Name(String fName, String mName, String lName) {
		super();
		this.fName = fName;
		this.mName = mName;
		this.lName = lName;
	}
	public Name() {
		super();
	}
	public String getfName() {
		return fName;
	}
	public void setfName(String fName) {
		this.fName = fName;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public String getlName() {
		return lName;
	}
	public void setlName(String lName) {
		this.lName = lName;
	}
	@Override
	public String toString() {
		return "Name [fName=" + fName + ", mName=" + mName + ", lName=" + lName + "]";
	}
	
	
}
