## Classes


### `Customer`

**Properties**
id: Integer
name: String
email: String
phone: String
address1: String
address2: String
town: String
post_code: String
approved_to_adopt: Boolean

**Object Methods**
save()

**Class Methods**
map_items(Hash[]): Customer[]
delete_all(id)


### `Animal`

**Properties**
id: Integer
name: String
admission_date: String
status: Integer

**Object Methods**
save()

**Class Methods**
map_items(Hash[]): Animal[]
delete_all(id)

### `Adoption`

**Properties**
id: Integer
customer_id: Integer
animal_id: Integer
adoption_date: String

**Object Methods**
save()

**Class Methods**
map_items(Hash[]): Adoption[]
delete_all(id)