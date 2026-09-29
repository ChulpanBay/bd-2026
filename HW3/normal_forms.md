## 1. Аномалия в таблице anomal_enrollment(нарушение 2НФ)

CREATE TABLE anomal_enrollment (
    student_id integer,
    course_id integer,
    student_name varchar(100), 
    grade integer,
    
    PRIMARY KEY (student_id, course_id)
);

**Нарушение: поле student_name зависит только от student_id, т.е. от части составного ключа**

**Решение:
Необходимо убрать частичную зависимость. Поле `student_name` не должно храниться в таблице, так как оно зависит только от `student_id`.**
*   Удаляем `student_name` из `anomal_enrollment`.
*   Возвращаем первичный ключ `id` в таблицу `anomal_enrollment`.
*   Имя студента остается только в таблице `students`.

## 2. Аномалия в таблице anomal_course(нарушение 3НФ)

CREATE TABLE anomal_course (
    id integer PRIMARY KEY,
    title varchar(100),
    instructor_id integer,
    instructor_name varchar(100) 
);

**Нарушение: instructor_name зависит от instructor_id, а instructor_id зависит от id - транзитивная зависимость**

**Решение:
Устраняем транзитивную зависимость: `id` -> `instructor_id` -> `instructor_name`.**
*   Удаляем `instructor_name` из таблицы `courses`.
*   Оставляем только `instructor_id` как внешний ключ.
*   Информация о имени преподавателя хранится в таблице `instructor`.