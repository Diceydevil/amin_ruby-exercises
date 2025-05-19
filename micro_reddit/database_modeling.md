
For each of the following scenarios, write down the models, columns, validations and associations you might use to implement it.



1. You are building an online learning platform (much like this!). 
You’ve got many different courses, each with a title and description, and each course has multiple lessons. 
Lesson content consists of a title and body text.

models (columns / attributes):
- User (username, email, role:string, created_at, updated_at)
- Course (title, description, difficulty_level:string, category:string, published:boolean, created_at, updated_at)
- Lesson (title, body_text, position:integer, video_url:string, created_at, updated_at)
- Enrollment (user_id:integer, course_id:integer, completed:boolean, progress:integer, created_at, updated_at)
- UserLesson (user_id:integer, lesson_id:integer, completed:boolean, last_accessed_at:datetime)

validations:
- User (username presence:true, uniqueness:true, email presence:true, uniqueness:true, format:email)
- Course (title presence:true, length:{minimum:5}, description presence:true)
- Lesson (title presence:true, body_text presence:true, position presence:true, numericality:true)
- Enrollment (user_id presence:true, course_id presence:true, uniqueness:{scope: :user_id})

associations:
- User has_many :enrollments
- User has_many :courses, through: :enrollments
- User has_many :user_lessons
- User has_many :completed_lessons, through: :user_lessons, source: :lesson
- Course belongs_to :instructor, class_name: "User"
- Course has_many :lessons, dependent: :destroy
- Course has_many :enrollments
- Course has_many :enrolled_users, through: :enrollments, source: :user
- Lesson belongs_to :course
- Lesson has_many :user_lessons
- Lesson has_many :learning_users, through: :user_lessons, source: :user
- Enrollment belongs_to :user
- Enrollment belongs_to :course
- UserLesson belongs_to :user
- UserLesson belongs_to :lesson

indexes:
- add_index :courses, :instructor_id
- add_index :lessons, :course_id
- add_index :enrollments, [:user_id, :course_id], unique: true
- add_index :user_lessons, [:user_id, :lesson_id]



2. You are building the profile tab for a new user on your site. 
You are already storing your user’s username and email, but now you want to collect demographic information like city, state, country, age and gender. 
Think – how many profiles should a user have? How would you relate this to the User model?

models (columns / attributes)
- User (username, email, created_at, updated_at)
- Profile (user_id:integer, age:integer, gender:string, created_at, updated_at)
- Address (first_line_of_address:string, city:string, state:string, country:string, address_type:string, profile_id:integer, created_at, updated_at)

validations
- User (username presence:true, uniqueness:true, email presence:true, uniqueness:true, format:email)
- Profile (user_id presence:true, uniqueness:true, age numericality:{greater_than: 0, less_than: 120}, gender inclusion:{in: %w[male female other prefer_not_to_say]})
- Address (first_line_of_address presence:true, city presence:true, country presence:true, address_type presence:true, inclusion:{in: %w[billing home work other]}, profile_id presence:true)

associations
- User has_one :profile, dependent: :destroy
- User has_many :addresses, through: :profile
- Profile belongs_to :user
- Profile has_many :addresses, dependent: :destroy
- Address belongs_to :profile

indexes
- add_index :profiles, :user_id, unique: true
- add_index :addresses, :profile_id
- add_index :addresses, [:profile_id, :address_type]



3. You want to build a virtual pinboard, so you'll have users on your platform who can create "pins". 
Each pin will contain the URL to an image on the web. Users can comment on pins (but can't comment on comments).

models (columns / attributes)
- user (username, email, created_at, updated_at)
- board (title, description, user_id, created_at, updated_at)
- pin (url, board_id, created_at, updated_at)
- comment (text, user_id, pin_id, created_at, updated_at)

validations:
- User (username presence: true, uniqueness: true, email presence: true)
- Board (title presence: true, user_id presence: true)
- Pin (url presence: true, board_id presence: true)
- Comment (text presence: true, user_id presence: true, pin_id presence: true)

associations:
- User (has_many :boards, has_many :comments, has_many :pins, through: :boards)
- Board (belongs_to :user, has_many :pins)
- Pin (belongs_to :board, has_many :comments)
- Comment (belongs_to :pin, belongs_to :user)

indexes:
- add_index :boards, :user_id
- add_index :pins, :board_id  
- add_index :comments, [:pin_id, :user_id]

4. You want to build a message board like Hacker News. Users can post links. Other users can comment on these submissions or comment on the comments. How would you make sure a comment knows where in the hierarchy it lives?

models (columns / attributes)
- User (username:string, email:string, created_at, updated_at)
- Link (title:string, url:string, user_id:integer, created_at, updated_at)
- Comment (content:text, user_id:integer, link_id:integer, parent_id:integer, created_at, updated_at)
- Board (name:string, description:text, created_at, updated_at)

validations
- User (username presence:true, uniqueness:true, email presence:true, uniqueness:true, format:email)
- Link (title presence:true, url presence:true, user_id presence:true)
- Comment (content presence:true, user_id presence:true)
- Board (name presence:true, uniqueness:true)

associations
- User (has_many :links, has_many :comments)
- Link (belongs_to :user, has_many :comments)
- Comment (belongs_to :user, belongs_to :link, belongs_to :parent, class_name: "Comment", optional: true, has_many :replies, class_name: "Comment", foreign_key: :parent_id)
- Board (has_many :links)

indexes
- add_index :links, :user_id
- add_index :comments, :user_id
- add_index :comments, :link_id
- add_index :comments, :parent_id



# Types:
- belongs_to
- has_one
- has_many
- has_many :through
- has_one :through
- has_and_belongs_to_many
- Polymorphic
- Joint
- Self Joins
- STI
- Delegated Types
- Composite Primary Keys