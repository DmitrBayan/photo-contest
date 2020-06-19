ActiveAdmin.register Post do
  config.clear_action_items!
  config.per_page = [5, 10, 50, 100]
  permit_params :name, :disposition


  controller do
    def destroy
      resource.delete!
      redirect_to admin_posts_path
    end
  end

  batch_action I18n.t(:ban) do |ids|
    batch_action_collection.find(ids).each do |post|
      post.ban! :ban
    end
    redirect_to admin_posts_path
  end

  batch_action I18n.t(:approve) do |ids|
    batch_action_collection.find(ids).each do |post|
      post.approve! :approve
    end
    redirect_to admin_posts_path
  end

  batch_action :destroy do |ids|
    batch_action_collection.find(ids).each do |post|
      post.delete! :delete
    end
    redirect_to admin_posts_path
  end

  index do
    selectable_column
    column :title
    column :photo do |pg|
      image_tag pg.photo.admin.url
    end
    column :aasm_state
    column :moderation do |pg|
      columns do
        if pg.aasm_state == 'moderated'
          column do
            link_to :approve, approve_admin_post_path(pg), class: 'button2'
          end
          column do
            link_to :ban, ban_admin_post_path(pg), class: 'button1'
          end
        elsif pg.aasm_state == 'approved'
          column do
            link_to :ban, ban_admin_post_path(pg), class: 'button1'
          end
        elsif pg.aasm_state == 'deleted'
          column do
            link_to :restore, restore_admin_post_path(pg), class: 'button2'
          end
        else
          column do
            link_to :approve, approve_admin_post_path(pg), class: 'button2'
          end
        end
      end
    end
    actions
  end

  show do
    attributes_table do
      photo = Post.find_by(id: params[:id])
      row :photo do |ad|
        image_tag ad.photo.show.url
      end
      row :title
      row :author, :user_id do
        link_to('Author', User.find_by_id(photo.user_id))
      end
      row :created_at
      row :updated_at
      row :id
      row :aasm_state
    end

  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
    end
    f.actions
  end

  member_action :approve do
    photo = Post.find_by(id: params[:id])
    resource.approve!
    redirect_to admin_posts_path
  end

  member_action :ban do
    photo = Post.find_by(id: params[:id])
    resource.ban!
    redirect_to admin_posts_path
  end

  member_action :restore do
    resource.restore!
    redirect_to admin_posts_path
  end
end
