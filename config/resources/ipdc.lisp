(define-resource public-service ()
  :class (s-prefix "ipdc:InstancePublicServiceSnapshot")
  :properties `((:name :language-string-set ,(s-prefix "dct:title"))
                (:description :language-string-set ,(s-prefix "dct:description"))
                (:additional-description :language-string-set ,(s-prefix "ipdc:additionalDescription"))
                (:keyword :language-string-set ,(s-prefix "dcat:keyword"))
                (:regulations :language-string-set ,(s-prefix "ipdc:regulation"))
                (:exceptions :language-string-set ,(s-prefix "ipdc:exception"))
                (:start-date :datetime ,(s-prefix "schema:startDate"))
                (:end-date :datetime ,(s-prefix "schema:endDate"))
                (:date-created :datetime ,(s-prefix "schema:dateCreated"))
                (:date-modified :datetime ,(s-prefix "schema:dateModified"))
                (:product-id :string ,(s-prefix "schema:productID")))
  :has-one `((concept :via ,(s-prefix "dct:type")
               :as "type")
              (conceptual-public-service :via ,(s-prefix "dct:source")
                :as "concept"))
  :has-many `((concept :via ,(s-prefix "dct:language")
                :as "language")
               (concept :via ,(s-prefix "ipdc:targetAudience")
                 :as "target-audiences")
               (concept :via ,(s-prefix "m8g:thematicArea")
                 :as "thematic-areas")
               ;; (location :via ,(s-prefix "dct:spatial")
               ;;   :as "spatial")
               (concept :via ,(s-prefix "ipdc:competentAuthorityLevel")
                 :as "competent-authority-levels")
               (concept :via ,(s-prefix "ipdc:executingAuthorityLevel")
                 :as "executing-authority-levels")
               (website :via ,(s-prefix "rdfs:seeAlso")
                 :as "websites"))
  :resource-base (s-url "http://data.lblod.info/id/public-service/")
  :features '(include-uri)
  :on-path "public-services"
  )

(define-resource website ()
  :class (s-prefix "schema:WebSite")
  :properties `((:title :language-string-set ,(s-prefix "dct:title"))
                 (:description :language-string-set ,(s-prefix "dct:description"))
                 (:url :string ,(s-prefix "schema:url")))
  :has-one `((public-service :via ,(s-prefix "rdfs:seeAlso")
               :inverse t
               :as "public-service"))
  :resource-base (s-url "http://lblod.data.gift/websites/")
  :on-path "websites")
