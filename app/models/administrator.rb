class Administrator < User
  has_and_belongs_to_many :roles

  def self.inherited(child)                                                                                                                                   
    child.instance_eval do                                                                                                                                    
      def model_name                                                                                                                                          
        User.model_name                                                                                                                                       
      end                                                                                                                                                     
    end                                                                                                                                                       
    super                                                                                                                                                     
  end   
end
