*HOSPITAL APP*

Patient
    - @name  (String)
    - @cured (Boolean)

Room
    - @capacity (Integer)
    - @patients (Array of Patient instances)

*SPECS*
- assign a Patient to a Room
- bilateral relation
    - read the @patients for Room
    - read the @room for Patient

- permanence: store instances, and relations in CSV
