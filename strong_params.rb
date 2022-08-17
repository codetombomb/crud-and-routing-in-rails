require "pry"
class User
    attr_accessor :name, :email, :admin

    def initialize(attrs={})
        attrs.each do |attribute,value|
            binding.pry
            self.send("#{attribute}=", value)
            # "#{@attribute}=" attrs[:name]
            # @email =  attrs[:email]
        end
    end

    def can_call
        cant_call
    end

    private

    def cant_call
        puts "Cant call from the outside"
    end

end

employee_params = {
    name: "Tesla Employee",
    email: "notaboss@tesla.com",
    admin: true
}
boss_params = {
    name: "Tesla Employee",
    email: "notaboss@tesla.com"
}

employee = User.new(employee_params)

binding.pry