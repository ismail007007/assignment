class PostsController < ApplicationController
    
    # mount_uploader :bodyone, FileUploader
    # mount_uploader :bodytwo, FileUploader
    # attr_accessor :bodytwofile
    # after_save : save_bodytwofile_text, if: :bodytwocover

    # def save_bodytwofile_text
    #     filename = bodytwocover.original_filename
    #     folder= "#{Rails.root}/tmp/#{filename}"

    #     FileUtils:mkdir_p folder

    #     f=File.open
    
    # end
    def index
        @posts = Post.all
    end

    def show
        @post = Post.find(params[:id])

        
        # @post.bodyone = File.read(@post.bodyone)
        # @post.bodytwo = File.read(@post.bodytwo)
        puts "This is the id #{Post.last.id}"
        puts "This is #{@post.bodyone}"
        @filenameone = "#{@post.bodyone}".pathmap.split("/").last  
        @filenametwo = "#{@post.bodytwo}".pathmap.split("/").last  
         @one = File.read(Rails.root.join("public/uploads/post/bodyone/#{Post.last.id}/#{@filenameone}"))
         @two = File.read(Rails.root.join("public/uploads/post/bodytwo/#{Post.last.id}/#{@filenametwo}"))
        Differ.format = :ascii
        @highlight =  Differ.diff_by_word(@one, @two).to_s

        distance = Text::Levenshtein.distance(@one, @two).to_f
        @diff_percentage = (100 - calculate_diff(distance)).round(2)
    end

    def calculate_diff(distance)
        string_length = [(@one).length, (@two).length].max 
        distance / string_length * 100
    end

    def new
        @post = Post.new
    end

    def create
        #render plain: params[:post].inspect
        @post = Post.new(post_params)

        # @post.bodyone = File.read("./tmp/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}")
        # @post.bodytwo = File.read("./tmp/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}")

        if(@post.save)
            redirect_to @post
        else 
           render 'new'
        end 
    end

    private def post_params
        params.require(:post).permit(:bodyone,:bodytwo)
    end
end
