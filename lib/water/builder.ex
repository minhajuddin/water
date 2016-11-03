defmodule Water.Builder do
  @moduledoc """
  Once you `use` this module you get a method named `new` defined on your module

  #### Example

      defmodule User do
        defstruct [:name, :email, :dob]
        use Water.Builder
      end

      User.new(name: "Mujju", dob: "Jan 01") # => %User{name: "Mujju", email: nil, dob: "Jan 01"}

  This gives you a simple method which accepts a keyword list and returns an
  instance of the current struct
  """
  defmacro __using__(_opts) do
    quote do
      def new(params) do
        # we want to throw an error if keys are invalid
        struct!(__MODULE__, params)
      end
    end
  end
end
