//
//  Animal.swift
//  SearchPet
//
//  Created by Diego Olmo Cejudo on 22/11/21.
//

import RealmSwift

@objcMembers class Animal:Object, Codable {
    enum CodingKeys: String, CodingKey {
        case id
        case organizationID = "organization_id"
        case url
        case type
        case species
        case breeds
        case age
        case gender
        case size
        case coat
        case name
        case animalDescription = "description"
        case photos
        case status
        case environment
        case tags
        case contact
        case publishedAt = "published_at"
    }
    
    @Persisted var  id: Int
    @Persisted var  organizationID: String?
    @Persisted var  url: String?
    @Persisted var  type: String?
    @Persisted var  species: String?
    @Persisted var  age: String?
    @Persisted var  gender: String?
    @Persisted var  size: String?
    @Persisted var  coat: String?
    @Persisted var  name: String?
    @Persisted var  animalDescription: String?
    @Persisted var  photos = RealmSwift.List<Photo>()
    @Persisted var  status: String?
    @Persisted var  tags = RealmSwift.List<String>()
    @Persisted var  contact: Contact?
    @Persisted var  publishedAt: Date?
  
    required init(from decoder: Decoder) throws {
        super.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.organizationID = try container.decodeIfPresent(String.self, forKey: .organizationID)
        self.url = try container.decodeIfPresent(String.self, forKey: .url)
        self.type = try container.decodeIfPresent(String.self, forKey: .type)
        self.url = try container.decodeIfPresent(String.self, forKey: .url)
        self.species = try container.decodeIfPresent(String.self, forKey: .species)
        self.age = try container.decodeIfPresent(String.self, forKey: .age)
        self.gender = try container.decodeIfPresent(String.self, forKey: .gender)
        self.size = try container.decodeIfPresent(String.self, forKey: .size)
        self.coat = try container.decodeIfPresent(String.self, forKey: .coat)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.animalDescription = try container.decodeIfPresent(String.self, forKey: .animalDescription)
        let list_photos = try container.decodeIfPresent([Photo].self, forKey: .photos)
        if let photos = list_photos { self.photos.append(objectsIn: photos) }
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
        let list_tags = try container.decodeIfPresent([String].self, forKey: .tags)
        if let tags = list_tags { self.tags.append(objectsIn: tags) }
        self.contact = try container.decodeIfPresent(Contact.self, forKey: .contact)
        let stringDate = try container.decodeIfPresent(String.self, forKey: .publishedAt)
        let formatter = DateFormatter.yyyyMMdd
        if let date = formatter.date(from: stringDate!) {
            self.publishedAt = date
        } else {
            self.publishedAt = nil
        }
    }
    
    public func encode(to encoder: Encoder) throws {}
    
    required override init() {
        super.init()
    }
    
    public func createItemViewModel() -> ItemAnimalViewModel {
        return ItemAnimal(id: self.id,type: self.type ?? "...", name: self.name ?? "...", gender: self.gender ?? "...", age: self.age ?? "...", coat: self.coat ?? "...", description: self.animalDescription ?? "...",image: self.photos.first?.large)
    }
}
