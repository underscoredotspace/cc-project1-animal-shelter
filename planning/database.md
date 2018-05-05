# Database: `animal_shelter`

## Tables

### `animals`

| Key | Name               | Type         | Relationships        |
|:---:|:-------------------|:-------------|:---------------------|
| p   | id                 | serial       |                      |
| f   | breed_id           | integer      | animal_breeds(id)    |
| f   | status_id          | integer      | animal_statuses (id) |
|     | admission_date     | date         |                      |
|     | name               | varchar(255) |                      |
|     | date_of_birth      | date         |                      |
|     | description        | text         |                      |

### `animal_statuses`

| Key | Name               | Type         | Relationships        |
|:---:|:-------------------|:-------------|:---------------------|
| p   | id                 | serial       |                      |
|     | status             | varchar(255) |                      |

- Animal `status` would be New/Availble/Adopted. 


### `animal_types`

| Key | Name              | Type         | Relationships     |
|:---:|:------------------|:-------------|:------------------|
| p   | id                | serial       |                   |
|     | type              | varchar(255) |                   |

- Animal `type` would be Cat/Dog/Parrot etc.

### `animal_breeds`

| Key | Name              | Type         | Relationships     |
|:---:|:------------------|:-------------|:------------------|
| p   | id                | serial       |                   |
| f   | type_id           | integer      | animal_types(id)  |
|     | breed             | varchar(255) |                   |

- - Animal `breed` would be Domestic Shorthair/English Springer Spaniel/Scarlet Macaw etc.

### `customers`
| Key | Name              | Type         | Relationships     |
|:---:|:------------------|:-------------|:------------------|
| p   | id                | serial       |                   |
|     | name              | varchar(255) |                   |
|     | email             | varchar(255) |                   |
|     | phone             | varchar(255) |                   |
|     | address1          | varchar(255) |                   |
|     | address2          | varchar(255) |                   |
|     | town              | varchar(255) |                   |
|     | post_code         | varchar(10)  |                   |
|     | approved_to_adopt | boolean      |                   |

### `adoptions`

| Key | Name              | Type         | Relationships     |
|:---:|:------------------|:-------------|:------------------|
| p   | id                | serial       |                   |
| f   | animal_id         | integer      | animals(id)       |
| f   | customer_id       | integer      | customers(id)     |
|     | adoption_date     | date         |                   |