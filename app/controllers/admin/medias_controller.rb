module Admin
  class MediasController < Admin::ApplicationController
    # Overwrite any of the RESTful controller actions to implement custom behavior
    # For example, you may want to send an email after a foo is updated.
    #
    def create
      respond_to do |format|
        format.turbo_stream do
          media = Media.new(**media_params, inline: true)
          if media.save
            render partial: "created", locals: { media: media }
          else
            errors = media.errors.full_messages
            render turbo_stream: turbo_stream
                                   .replace("nested_media_flash", partial: "form_errors", locals: { errors: errors })
          end
        end
        format.html { super }
      end
    end

    def destroy
      respond_to do |format|
        format.js do
          if requested_resource.destroy
            render partial: "destroyed", locals: { media: requested_resource }
          else
            errors = requested_resource.errors.full_messages
            render turbo_stream: turbo_stream
                                   .replace("nested_media_flash", partial: "nested_form_flashes", locals: { errors: errors })
          end
        end
        format.html { super }
      end
    end

    # Override this method to specify custom lookup behavior.
    # This will be used to set the resource for the `show`, `edit`, and `update`
    # actions.
    #
    # def find_resource(param)
    #   Foo.find_by!(slug: param)
    # end

    # The result of this lookup will be available as `requested_resource`

    # Override this if you have certain roles that require a subset
    # this will be used to set the records shown on the `index` action.
    #
    # def scoped_resource
    #   resource_class.where(inline: false)
    # end

    # Override `resource_params` if you want to transform the submitted
    # data before it's persisted. For example, the following would turn all
    # empty values into nil values. It uses other APIs such as `resource_class`
    # and `dashboard`:
    #
    def resource_params
      params.require(:media).permit(:owner_type, :owner_id, :name, :file)
    end

    alias media_params resource_params

    # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
    # for more information
  end
end