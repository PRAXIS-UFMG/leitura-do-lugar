# frozen_string_literal: true

class CollectionIndexComponentPreview < ViewComponent::Preview
  def user
    render CollectionIndexComponent.new User.take(10), :'user-add',
                                        username: { header: 'w-24' },
                                        name: { header: 'w-56' },
                                        admin: { cell: 'text-sm font-bold text-center text-gray-700' }
  end
end
