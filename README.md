# 🛒 Java E-Commerce Web Application

![Java](https://img.shields.io/badge/Java-Servlets-orange?logo=java)
![JSP](https://img.shields.io/badge/JSP-frontend-blue)
![Gradle](https://img.shields.io/badge/Gradle-build%20tool-brightgreen)
![License](https://img.shields.io/github/license/kalpesh-vala/kalpesh-vala-java-e-commerce)

---

## 📌 Overview

**Java E-Commerce Web Application** is a complete online shopping platform built using **Java Servlets**, **JSP**, and **JDBC**. It allows customers to browse products, add them to a cart, manage profiles, and place orders in a smooth and secure manner. This project is ideal for understanding **MVC architecture**, **database operations**, and building dynamic web applications using **JSP and Servlets**.

---

## 🎯 Key Features

✅ Customer Registration and Login  
✅ Browse Products by Category  
✅ Add/Remove from Shopping Cart  
✅ View and Edit Profile  
✅ Servlet-based MVC Architecture  
✅ JSP for Dynamic Views  
✅ CSS for custom styling  
✅ Session Management and Routing  
✅ Database connectivity with MySQL

---

## 🛠️ Tech Stack

| Layer      | Technology                     |
|------------|--------------------------------|
| Backend    | Java (Servlets), JDBC          |
| Frontend   | JSP, HTML5, CSS3               |
| Styling    | Plain CSS                      |
| Database   | MySQL                          |
| Build Tool | Gradle                         |
| Server     | Apache Tomcat (Recommended)    |
| Architecture | MVC                          |

---

## 🏗️ Project Structure

```
kalpesh-vala-java-e-commerce/
├── gradle/ # Gradle wrapper settings
├── src/
│ └── main/
│ ├── java/com/
│ │ ├── dao/ # DAO layer for DB operations
│ │ ├── entites/ # Java Bean classes
│ │ ├── servlet/ # Servlet controllers
│ │ └── sqldb/ # DB connection class
│ └── webapp/
│ ├── *.jsp # JSP frontend pages
│ ├── assets/css/ # Custom CSS
│ ├── META-INF/ # Context configuration
│ └── WEB-INF/ # Web deployment descriptor
├── gradle.properties
├── gradlew / gradlew.bat # Gradle wrapper
├── LICENSE
└── README.md
```


---

## 🚀 How to Run the Project

### 📦 Prerequisites

- JDK 11 or above  
- Apache Tomcat 9+  
- MySQL Server  
- Gradle installed (or use `gradlew`)  

### ⚙️ Setup Instructions

1. **Clone the repository**
   ```bash
   git clone https://github.com/kalpesh-vala/kalpesh-vala-java-e-commerce.git
   ```
2. **Import the project into IntelliJ IDEA / Eclipse**
   - Use "Import as Gradle Project" option
3. **Configure Database**
   - Create a MySQL database
   - Update DB credentials in dbConn.java
4. **Deploy on Apache Tomcat**
    - Export as WAR or run directly using IDE's Tomcat integration
5. **Access the App**
    ```bash
    http://localhost:8080/kalpesh-vala-java-e-commerce/
    ```

🌟 Like this Project?

Give it a ⭐ on GitHub and feel free to fork or contribute!

---

Let me know if you'd like:
- A **resume snippet** for this project description,
- A **Dockerized** version of this app (Tomcat + MySQL),
- Sample **ER Diagram**,
- SQL dump for DB setup.

Would you like me to generate that resume entry next?

