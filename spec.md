** Rails Project Requirements **

1. Use the Rubu on Rails Framework. [x]
2. Models must include at least one has_many, at least one belongs_to, and at least two has_many :through relationships and include a many-to-many relationship implemented with has_many :through associations. The join table must include a user-submittable attribute — that is to say, some attribute other than its foreign keys that can be submitted by the app's user. [x]
3. Your models must include reasonable validations for the simple attributes. You don't need to add every possible validation or duplicates, such as presence and a minimum length, but the models should defend against invalid data. [x]
4. You must include at least one class level ActiveRecord scope method. a. Your scope method must be chainable, meaning that you must use ActiveRecord Query methods within it (such as .where and .order) rather than native ruby methods (such as #find_all or #sort). [x]
5. Your application must provide standard user authentication, including signup, login, logout, and passwords. [x]
6. Your authentication system must also allow login from some other service. Facebook, Twitter, Foursquare, Github, etc... [x]
7. You must include and make use of a nested resource with the appropriate RESTful URLs, e.g. You must include a nested new route with form that relates to the parent resource and you must include a nested index or show route. [x]
8. Your forms should correctly display validation errors, e.g. Your fields should be enclosed within a fields_with_errors class and error messages describing the validation failures must be present within the view. [x]
9. Your application must be, within reason, a DRY (Do-Not-Repeat-Yourself) rails app, e.g. Logic present in your controllers should be encapsulated as methods in your models, your views should use helper methods and partials when appropriate and follow patterns in the Rails Style Guide and the Ruby Style Guide. [x]
10. Do not use scaffolding to build your project. [x]