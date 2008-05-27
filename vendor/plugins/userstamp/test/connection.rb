ActiveRecord::Base.configurations = {
  'test' => {
    :adapter  => "mysql",
    :host     => "127.0.0.1",
    :username => "root",
    :password => "",
    :database => "userstamp_test"
  }
}

ActiveRecord::Base.establish_connection(ActiveRecord::Base.configurations['test'])