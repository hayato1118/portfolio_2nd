module ApplicationHelper


# ============================= user用 ================================

    def resource_name
        :user
    end

    def resource
        @resource ||= User.new
    end

    def devise_mapping
        @devise_mapping ||= Devise.mappings[:user]
    end

    def simple_time(time)
	    time.strftime("%Y-%m-%d：%H:%M:%S")
	end


# ============================= admin用 ================================

    def resource_name_admin
        :admin
    end

    def resource_admin
        @resource ||= Admin.new
    end

    def devise_mapping_admin
        @devise_mapping ||= Devise.mappings[:admin]
    end

    def simple_time(time)
        time.strftime("%Y-%m-%d：%H:%M:%S")
    end


# ================================ソート用======================================

def sortable(column, title = nil)
    title ||= column.titleize
    # titleizeは全ての単語の先頭の文字を大文字にする
    css_class = (column == sort_column) ? "current #{sort_direction}" : nil
    direction = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"
    link_to title, {:sort => column, :direction => direction}, {:class => css_class}
  end


end

