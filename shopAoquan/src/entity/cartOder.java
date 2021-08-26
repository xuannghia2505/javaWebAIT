package entity;

public class cartOder {
	private int id;
	private String image;
	private String name;
	private double price;
	private int soluong;
	public cartOder() {
		super();
		// TODO Auto-generated constructor stub
	}
	public cartOder(int id, String image, String name, double price, int soluong) {
		super();
		this.id = id;
		this.image = image;
		this.name = name;
		this.price = price;
		this.soluong = soluong;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getSoluong() {
		return soluong;
	}
	public void setSoluong(int soluong) {
		this.soluong = soluong;
	}
	@Override
	public String toString() {
		return "cartOder [id=" + id + ", image=" + image + ", name=" + name + ", price=" + price + ", soluong="
				+ soluong + "]";
	}
	
	
}
