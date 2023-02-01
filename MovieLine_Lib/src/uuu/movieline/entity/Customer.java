package uuu.movieline.entity;

import java.time.LocalDate;

import uuu.movieline.exception.MLInvalidDataException;

public class Customer {
	private String id; // Pkey 符合 ROC I
	private String email; // 必要欄位,unique index
	private String password; // 必要欄位,6~20個字元
	private String name; // 必要欄位,2~20個字元
	private LocalDate birthday; // 必要欄位,年滿12, import java.time.LocalDate
	private char gender; // 必要欄位,F-女,M-男,U-不透漏

	private String address = ""; // x
	private String phone = new String("");// x
	private boolean subscribed;// x
//以下為BloodType屬性
//	private BloodType bloodType;
//
//	public BloodType getBloodType() {
//		return bloodType;
//	}
//
//	public void setBloodType(BloodType bloodType) {
//		this.bloodType = bloodType;
//	}
//以上為BloodType屬性
	public Customer() {
	}

	public Customer(String id, String email, String password) {
		this.setId(id);
		this.setEmail(email);
		this.setPassword(password);
	}

	public Customer(String id, String email, String password, String name) {
		this(id, email, password);
		this.setName(name);
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		if (checkId(id)) {
			this.id = id;
		} else {
			//System.err.println("客戶ID必須符合ROC ID規則" + id);
			//第13章後要改成throw RuntimeException
			throw new MLInvalidDataException("客戶ID必須符合ROC ID規則" + id);
		}

	}

	private static final String ID_PATTERN = "[A-Z][1289]\\d{8}";

	/**
	 * 傳入身分證判斷是否符合ROC ID規則
	 * 
	 * @param id String:身分證
	 * @return boolean:正確或錯誤
	 * 
	 */

	public static boolean checkId(String id) {
		if (id != null && id.matches(ID_PATTERN)) {
			// 將id第0碼轉成對應數字
			char firstChar = id.charAt(0);
			int firstNumber = -1;
			firstNumber = "ABCDEFGHJKLMNPQRSTUVXYWZIO".indexOf(firstChar) + 10;

			int sum = (firstNumber / 10) + (firstNumber % 10) * 9;

			for (int i = 1, j = 8; i < 10; i++, j--) {
				sum += ((id.charAt(i) - '0') * (j > 0 ? j : 1));

			}

			return sum % 10 == 0;
		} else {
			return false;
		}
	}

	public String getEmail() {
		return email;
	}

	private static final String EMALL_PATTERN = "^\\w+@[a-zA-Z_]+?\\.[a-zA-Z]{2,3}$";

	public void setEmail(String email) {
		if (email != null && email.matches(EMALL_PATTERN)) {
			this.email = email;
		} else {
			//第13章，改用throw 來處理Exception
			String msg = String.format("email必須輸入且符合email應有格式:%s\n",email);
			throw new MLInvalidDataException(msg);
		}

	}

	private static final int MIN_PASSWORD_LENGTH = 6;
	private static final int MAX_PASSWORD_LENGTH = 20;

	/**
	 * 設定密碼
	 * 
	 * @param pwd 密碼
	 */
	public void setPassword(String pwd) {
		if (pwd != null && pwd.length() >= MIN_PASSWORD_LENGTH && pwd.length() <= MAX_PASSWORD_LENGTH) {
			this.password = pwd;
		} else {
			String msg = String.format("密碼必須輸入%d~%d個字元 [%s] 不正確\n", MIN_PASSWORD_LENGTH, MAX_PASSWORD_LENGTH, pwd);
			throw new MLInvalidDataException(msg);
		}
	}

	public String getPassword() {
		return this.password;
	}

	private static final int MIN_NAME_LENGTH = 2;
	private static final int MAX_NAME_LENGTH = 20;

	public void setName(String n) {
		if (n != null && n.length() >= MIN_NAME_LENGTH && n.length() <= MAX_NAME_LENGTH) {
			this.name = n;
		} else {
			String msg = String.format("姓名必須輸入%s~%s個字元 [%s] 不正確\\n", MIN_NAME_LENGTH, MAX_NAME_LENGTH, n);
			throw new MLInvalidDataException(msg);
		}
	}

	public String getName() {
		return this.name;
	}

	/**
	 * 計算參數指定日期的年齡 Derived Attribute(衍生屬性):屬性的值是由其它屬性計算出來的, 本身 並不存在.
	 * 
	 * @param birthDate 指定的出生日期
	 * @return >=0 年齡 或-1表示null的出生日期無法計算
	 * @exception 客戶無生日資料拋出MLInvalidDataException
	 */
	public static int getAge(LocalDate birthDate) {
		int thisYear = LocalDate.now().getYear(); // 取得今年的整數值

		if (birthDate != null) {
			int birthYear = birthDate.getYear(); // 取得birthDate的整數值

			int age = thisYear - birthYear;
			// 用月份與日期的差異來微調age(-1)

			return age;
		} else {
			// 第13章，改用throw 來處理Exception
			String msg = String.format("客戶為null，無法計算年齡");
			throw new MLInvalidDataException(msg);
		}

	}

	/**
	 * 依據屬性birthday的日期計算客戶年齡 Derived Attribute(衍生屬性):屬性的值是由其它屬性計算出來的, 本身 並不存在.
	 * 
	 * @return >=12年齡 or -1表示屬性birthday 為null
	 */
	public int getAge() {
		return getAge(this.getBirthday());
	}

	public char getGender() {
		return gender;
	}

	public static final char MALE = 'M';
	public static final char FEMALE = 'F';
	public static final char UNKNOW = 'U';

	/**
	 * 傳入 'M','F','U' 代號
	 * 
	 * @param gender 性別代號
	 */
	public void setGender(char gender) {
		if (gender == MALE || gender == FEMALE || gender == UNKNOW) {
			this.gender = gender;
		} else {
//			System.err.printf("客戶性別資料不正確:%s 必須是:(%s|%s|%s)\n", gender, MALE, FEMALE, UNKNOW);
			String msg = String.format("客戶性別資料不正確:%s 必須是:(%s|%s|%s)\n", gender, MALE, FEMALE, UNKNOW);
			throw new MLInvalidDataException(msg);
		}

	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		if (address != null) {
			this.address = address;
		} else {
			this.address = "";
		}
	}

	public boolean isSubscribed() {
		return subscribed;
	}

	public void setSubscribed(boolean subscribed) {
		this.subscribed = subscribed;
	}

	public String getPhone() {
		return phone;
	}

	/**
	 * allow null
	 * 
	 * @param phone
	 */
	public void setPhone(String phone) {
		this.phone = phone;
	}

	/**
	 * 1.將birthDayString轉換成對應的birthday的型態<br>
	 * 2.呼叫this.setBirthday(轉換後的物件)集中檢查年齡限制
	 * 
	 * @param birthDayString
	 */
	public void setBirthday(String birthDayString) {
		LocalDate birthDate = LocalDate.parse(birthDayString);
		// 2.呼叫this.setBirthday(轉換後的物件)集中檢查年齡限制
		this.setBirthday(birthDate);
	}

	/**
	 * 
	 * @param year  生日年份
	 * @param month 生日月份
	 * @param day   生日幾號
	 */
	public void setBirthday(int year, int month, int day) {
		LocalDate birthDate = LocalDate.of(year, month, day);

		// 呼叫this.setBirthday(轉換後的物件)集中檢查
		this.setBirthday(birthDate);
	}

	private static final int MIN_AGE = 12;

	public void setBirthday(LocalDate birthday) {
		if (birthday != null && getAge(birthday) >= 12) {
			this.birthday = birthday;
		} else {
			String msg = String.format("年齡必須大於:%d歲 你輸入的生日:%s\n", MIN_AGE, birthday);
			throw new MLInvalidDataException(msg);
		}

	}

	public LocalDate getBirthday() {
		return this.birthday;
	}

	@Override
	public String toString() {
		return this.getClass().getName() + "\n[ 身分證 = " + id + ", email = " + email + ", 密碼 = " + password + ", 姓名 = "
				+ name + ", \n生日 = " + birthday + ", 性別 = " + gender + ", 地址 = " + address + ", 電話 = " + phone
				+ ", 是否訂閱電子報 = " + subscribed + ", 年齡 = " + (birthday!=null? getAge():"" )+ "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (!(obj instanceof Customer))
			return false;
		Customer other = (Customer) obj;
		if (this.id == null || other.id == null) { // 防止id null
			return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

	// TODO:將性別改成列舉型別
	// enum Gender{
	// MALE('M'),FEMALE('F'),UNKNOW('U');
	//
	// private char genderCode;
	// private Gender(char genderCode) {
	// this.genderCode = genderCode;
	// }
	// }
}