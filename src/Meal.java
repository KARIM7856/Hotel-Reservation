import javax.persistence.Entity;

@Entity
public class Meal {
	String meal;

	/**
	 * @param meal
	 */
	public Meal(String meal) {
		super();
		this.meal = meal;
	}

	public String getMeal() {
		return meal;
	}

	public void setMeal(String meal) {
		this.meal = meal;
	}
	
}
