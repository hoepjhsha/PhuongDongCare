# 🏥 PhuongDongCare — Medical Office Management System (Spring Boot + MySQL)

**PhuongDongCare** is a web-based medical office management system built using **Spring Boot** and a **standalone MySQL database**. It provides a secure and role-specific interface for managing appointments, consultations, and doctor-patient interactions in a digital healthcare environment.

---

## 👥 Actors & Roles

### 👤 Admin
- Oversees the entire platform.
- Can view all registered doctors and patients.
- Can **delete** doctor or patient accounts (but **not** add or edit).
- Can view all scheduled **appointments**.
- **Cannot** modify or delete appointments.
- **Cannot** view private **consultations** between doctors and patients.

### 👨‍⚕️ Doctor
- Registers using a secure sign-up form that includes:
  - Medical license code
  - National ID card number
- Can log in to access the **Doctor Dashboard**.
- Features:
  - Update personal profile and information.
  - Add or delete **appointments** (only old or completed ones).
  - Create **consultations** post-appointment including:
    - Prescription notes
    - Side advice
    - Consultation fee
  - Once created, consultations **cannot be edited or deleted**.

### 🧑‍💻 Patient
- Can register or log in to access the **Patient Dashboard**.
- Features:
  - Edit personal profile and information.
  - View upcoming appointments made:
    - Online by themselves
    - Manually by the doctor after phone calls
  - Book appointments online by:
    - Filtering doctors by **specialty**
    - Choosing a doctor and booking via interface
  - View **consultations** if:
    - Paid in **cash**: marked as paid by doctor
    - Paid **online**: redirected to a payment page, then gains access

---

## 💳 Payment Logic

- Doctors set consultation status:
  - `PAID`: Patient paid in cash post-appointment.
  - `UNPAID`: For online payments – patient redirected to payment gateway.
- Once the payment is confirmed, patient gains full access to the consultation.