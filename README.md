# Routing & CRUD in Rails

## Announcements

- Thompson and I will be unavailable on Friday for professional development.

### SWABATs

- [ ]  Implement full CRUD in a Ruby on Rails application
- [ ]  Implement strong params in controllers
- [ ]  Implement custom routes
- [ ]  Implement validations in rails

## Overview of How a Rails MVC Works

![Overview of How a Rails MVC Works]([https://s3-us-west-2.amazonaws.com/secure.notion-static.com/9f3fd8a2-8954-4950-9448-da53228dd8ee/Untitled.png](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F9f3fd8a2-8954-4950-9448-da53228dd8ee%2FUntitled.png?table=block&id=10897ca0-9297-4fd4-b027-a67400b37cd2&spaceId=9e9abdc0-7286-4167-bd40-cf4de0515891&width=2000&userId=85ac1292-afdb-4bd0-ab21-00deb2e5bd0f&cache=v2))

<aside>
💡 **Note on Serializers**: If you call `render json:` on a Ruby object or collection, Rails will construct JSON that uses a default format. Serializers in Rails give us the ability to customize the JSON output for a particular resource.

</aside>

### **Request**

What will the fetch request look like? (Method, endpoint, headers, and body)

### **Route**

What route do we need to match that request? which controller action will respond?

### **Controller**

What needs to happen within our controller action? Are there relevant params for this request? If it's a POST or PATCH request, we're most likely going to want to do mass assignment, so what parameters should we allow within our strong params?

### **Model (database)**

Are there any model methods that need to be defined to support the request? (Are there any inputs from the user that don't exactly match up with columns in the associated database table?)

What validations do we need to add to ensure the we’re not allowing users to add invalid or incomplete data to our database?

### **Response**

Depending on how our validations go, how should our controller action respond to the request? What should be included in the json? What should the status code be?

## **A note about Status Codes**

[Status Codes](https://www.notion.so/c95312139043481482867c46df5ff995)

See [railsstatuscodes.com](http://www.railsstatuscodes.com/) for a complete list with the corresponding symbols.

The status code in the response allows us to indicate to the frontend whether or not the request was a success. The way that we interact with the status code from our client side code is by working with the [response object](https://developer.mozilla.org/en-US/docs/Web/API/Response) that fetch returns a [promise](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise) for.

### **Example**

Fetch returns a promise for a response object. The first callback that we pass to `then` to consume that resolved promise value takes that response object as an argument. That response object has a status code and a body that we can read from. When we do `response.json()` in the promise callback, we're parsing the body of the response from JSON string format to the data structure that it represents. The response object also has an `ok` property that indicates that the status code is between 200-299

```jsx
fetch('http://localhost:3000/todos', {
  method: 'POST',
  headers: {
    'Content-Type': 'application/json'
  }, 
  body: JSON.stringify({description: "Learn strong params"})
})
  .then(response => {
    if(response.ok) {
      return response.json()
    } else {
      return response.json().then(errors => Promise.reject(errors))
    }
  })
  .then(todos => {
    console.log(todos) // happens if response was ok
  })
  .catch(errors => {
    console.error(errors) // happens if response was not ok
  })
```

If the response status is not in the 200-299 range, then ok will be false, so we'll want to return a rejected Promise for the response body parsed as json. We can then attach a catch callback to handle adding an error to state after it's caught by the catch callback.

## CRUD

1. GET - Retrieve resource information identified by the request
    1. Index action - All instances `Todo.all`
    2. Show action - An instance `Todo.find(params[:id]`
2. POST - Create a new resource
    1. Create action - Use mass assignment to create a todo `Todo.create(params)` ***We need to specify what attributes we want to permit - (admin example)***
3. PUT - Fully update a specific resource in its entirety
    1. Update action - `Todo.update(params)`
4. PATCH - Update only a portion of a specific resource
    1. Update action - `Todo.update(params)`
5. DELETE - Destroy an entire specific resource by the request
    1. Destroy action - `Todo.find(params[:id]).destroy`
    

Create new API only: [https://guides.rubyonrails.org/api_app.html#the-basic-configuration](https://guides.rubyonrails.org/api_app.html#the-basic-configuration) 

- Generates a Rails app that does not include middleware support for views (the “V” in the MVC architecture)
- Configures rails generators to not create views related files
- Generates the base controller (ApplicationController just like in Sinatra) to inherit from `ApplicationController` inherit from `ActionController::API` instead of `ActionController::Base`.

## **Objectives**

- [x]  Create a Ruby on Rails application (API)
- [x]  Todo Resource (without rails g resource)
- [x]  Create a migration
- [x]  Run the migration
- [x]  Create a model
- [x]  Create seeds
- [x]  Add routes
- [x]  Create the controller
- [x]  Define controller actions
- [ ]  Create User Resource
- [ ]  Create User validations
- [ ]  Create seeds
- [ ]  Define controller actions with validations
- [ ]  Define custom route for `Users#user_todos`
