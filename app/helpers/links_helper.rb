module LinksHelper
    def getSubclassTypeName(class_name)
        class_name.downcase[0...-4].capitalize()
    end
end
