

# 🧩 Sudoku Game – Assembly Language (8086, MASM)

### Run on **DOSBox** | Semester Project | L23-886 & L23-977

This project is an **8086 Assembly Language implementation of a Sudoku game**, designed to run in **DOSBox**.
It includes full keyboard-based navigation, boundary checking, grid rendering, and game logic.

---

## 🎮 Features

### ✔ **9×9 Sudoku Grid Display**

* The grid is printed using ASCII characters.
* Numbers are placed inside the fixed boundaries.

### ✔ **Keyboard Navigation**

Use arrow keys to move the pointer inside the grid:

* **Up / Down / Left / Right** arrow keys
* Pointer cannot cross borders (boundary checking implemented)

### ✔ **Input System**

* Press a number key (1–9) to fill a cell
* Automatically checks and handles grid coordinates

### ✔ **Boundary Protection**

* Prevents pointer from moving outside the grid
* Uses manual boundary formulas:

  ```
  left boundary  = (row * 320 + 172)
  right boundary = (row * 320 + 236)
  ```

### ✔ **Rendered in Graphics Mode**

* Works with **int 10h** graphics interrupts
* Uses pixel manipulation logic

### ✔ **Runs Perfectly on DOSBox**

* Built, assembled, and executed in **MASM**
* Run using `.exe` or `.com` file inside DOSBox environment

---

## 🛠 How to Run the Project (DOSBox)

### **1️⃣ Install DOSBox**

Download from: [https://www.dosbox.com/](https://www.dosbox.com/)

### **2️⃣ Mount Your Folder**

Inside DOSBox:

```
mount c path_to_your_project_folder
c:
```

### **3️⃣ Assemble the Program**

If using MASM:

```
masm sudoku.asm;
link sudoku.obj;
```

### **4️⃣ Run the Game**

```
sudoku.exe
```

Game will launch in graphical mode, showing the Sudoku grid.

---

## 📂 File Included

```
SUDOKU.asm     → Main source code
README.md      → Project documentation
```

---

## 🧠 Concepts Used

* 8086 Assembly Language
* Graphics Mode (`int 10h`)
* Keyboard Input (`int 16h`)
* Memory addressing
* Loops, JMP logic
* Boundary checking without `div`
* Coordinate calculation
* 9×9 grid drawing

---

## 📸 Output Preview (Text Description)

```
+---+---+---+---+---+---+---+---+---+
| 5 |   | 3 |   | 7 |   |   |   |   |
|   | 6 |   | 1 | 9 | 5 |   |   |   |
|   |   |   |   |   |   |   | 6 |   |
...
Use arrow keys to move, numbers to fill cells.
```

---

## 👨‍💻 Authors

* **L23-886**
* **L23-977**

FAST NUCES – Assembly Language Project

---

## 📜 License

This project is open-source for educational use.

