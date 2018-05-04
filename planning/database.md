# Database: `animal_shelter`

## Tables

### `animals`

| Key | Name              | Type         | Relationships     |
|:---:|:------------------|:-------------|:------------------|
| p   | id                | serial       |                   |
| f   | breed_id          | integer      | animal_breeds(id) |
|     | admission_date    | date         |                   |
|     | name              | varchar(255) |                   |
|     | date_of_birth     | date         |                   |
|     | description       | text         |                   |
|     | ready_for_adoption | boolean      |                   |


### `animal_types`

| Key | Name              | Type         | Relationships     |
|:---:|:------------------|:-------------|:------------------|
| p   | id                | serial       |                   |
|     | type              | varchar(255) |                   |

### `animal_breeds`

| Key | Name              | Type         | Relationships     |
|:---:|:------------------|:-------------|:------------------|
| p   | id                | serial       |                   |
| f   | type_id           | integer      | animal_types(id)  |
|     | breed             | varchar(255) |                   |

### `owners`
| Key | Name              | Type         | Relationships     |
|:---:|:------------------|:-------------|:------------------|
| p   | id                | serial       |                   |
|     | name              | varchar(255) |                   |
|     | email             | varchar(255) |                   |
|     | phone             | varchar(255) |                   |
|     | approved_to_adopt | boolean      |                   |

### `adoptions`

| Key | Name              | Type         | Relationships     |
|:---:|:------------------|:-------------|:------------------|
| p   | id                | serial       |                   |
| f   | animal_id         | integer      | animals(id)       |
| f   | owner_id          | integer      | owners(id)        |
|     | adoption_date     | date         |                   |