use_inline_resources  # you still have to do this, if you don't notifications off of this resource will be broken

# you have to worry about this
def whyrun_supported?
  true
end

action :make_file do 
    log "Adding '#{new_resource.name}' greeting as #{new_resource.path}" 
    file new_resource.path do 
       content "#{new_resource.name}, #{new_resource.title}!" 
       action :create 
 end