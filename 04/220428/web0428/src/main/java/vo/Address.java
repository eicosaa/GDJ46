package vo;

public class Address {
   private int id;
   private String zipCode;
   private String province;
   private String city;
   private String town;
   private String street;
   private String detailAddr;
   
   public Address() {}
   
   @Override
   public String toString() {
      return "Address [id=" + id + ", zipCode=" + zipCode + ", province=" + province + ", city=" + city + ", town="
            + town + ", street=" + street + ", detailAddr=" + detailAddr + "]";
   }

   public Address(int id, String zipCode, String province, String city, String town, String street,
         String detailAddr) {
      super();
      this.id = id;
      this.zipCode = zipCode;
      this.province = province;
      this.city = city;
      this.town = town;
      this.street = street;
      this.detailAddr = detailAddr;
   }
   
   
   public int getId() {
      return id;
   }
   public void setId(int id) {
      this.id = id;
   }
   public String getZipCode() {
      return zipCode;
   }
   public void setZipCode(String zipCode) {
      this.zipCode = zipCode;
   }
   public String getProvince() {
      return province;
   }
   public void setProvince(String province) {
      this.province = province;
   }
   public String getCity() {
      return city;
   }
   public void setCity(String city) {
      this.city = city;
   }
   public String getTown() {
      return town;
   }
   public void setTown(String town) {
      this.town = town;
   }
   public String getStreet() {
      return street;
   }
   public void setStreet(String street) {
      this.street = street;
   }
   public String getDetailAddr() {
      return detailAddr;
   }
   public void setDetailAddr(String detailAddr) {
      this.detailAddr = detailAddr;
   }  
}