package entity;

public class Product {
	private int pid;
	private String name;
	private String image;
	private float price;
	private String title;
	private String description;
	private String type;
	public Product() {
		// TODO Auto-generated constructor stub
	}
	public Product(int pid, String name, String image, float price, String title, String description, String type) {
		super();
		this.pid = pid;
		this.name = name;
		this.image = image;
		this.price = price;
		this.title = title;
		this.description = description;
		this.type = type;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	@Override
	public String toString() {
		return "Product [pid=" + pid + ", name=" + name + ", image=" + image + ", price=" + price + ", title=" + title
				+ ", description=" + description + ", type=" + type + "]";
	}
	
}
