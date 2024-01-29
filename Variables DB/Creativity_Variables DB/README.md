```ruby
#Data Processing for Three Datasets: The code processes three datasets named "ladrillo," "rope1," and "rope2." Each dataset is read from a file and undergoes several data cleaning and transformation steps, including:

  #-Filtering out rows with missing values in specific columns.
  #-Creating new columns, cleaning text data, and calculating the number of "usos" (uses) based on the presence of semicolons.
  #-Removing stop words and filtering out words with too few or too many characters.
  #-Identifying and handling words with more than four consecutive consonants.
  #-Aggregating data to count the number of "usos" per user.
  #-Creating new datasets containing user IDs, relevant variables, and the "creativityf" variable.
```{r} 
#Ladrillo:
#Load dataset
df<- read_dta(path)

df<-df %>% 
  filter(is.na(usuario_id)==F) %>%
  filter(is.na(ladrillo)==F) %>% 
  group_by(usuario_id) %>% 
  mutate(texto0 = ladrillo) %>% 
  mutate(texto1 = limpiar_aac(texto0)) %>% 
  ungroup()

df_word <- df %>% 
  mutate(treattext=texto1) %>% 
  
  unnest_tokens(uso, texto1, token = stringr::str_split, pattern = ";") %>%
  mutate(id_uso = row_number()) %>% 
  unnest_tokens(word, uso,  token = "words")  %>%
  anti_join(spanish_stop_words) %>% 
  mutate(consonantes=consonantes <- sapply(word, tiene_mas_de_4_consonantes_consecutivas)) %>% 
  mutate(Char=nchar(word)) %>% 
  filter(Char>3 & Char<24 ) %>% 
  mutate(newid=newid<-paste(usuario_id,id_uso, sep="_")) %>% 
  mutate(word=ifelse(consonantes==1,"",word)) %>% 
  mutate(id_uso=ifelse(consonantes==1,"",id_uso)) %>% 
  mutate(newid=ifelse(consonantes==1,"",newid)) %>% 
  select(-Char)

#A single value is left for each user and usage ID. This allows us to determine how many usages the user has
df_word2<- df_word[!duplicated(df_word$newid),]

df_word2<-df_word2 %>% 
  filter(consonantes==0) %>% 
  group_by(usuario_id) %>% 
  mutate(creativityf=n()) %>% 
  ungroup() 

df_word3<-df_word2[!duplicated(df_word2$usuario_id),]

df_word3<-df_word3 %>% 
  select(usuario_id, study, privacy, dropout, ladrillo, creativityf)

#Rope 1:
#Se carga la base de datos:
df<- read_dta(path)

df<-df %>% 
  filter(is.na(usuario_id)==F) %>%
  filter(is.na(rope1)==F) %>% 
  group_by(usuario_id) %>% 
  mutate(texto0 = rope1) %>% 
  mutate(texto1 = limpiar_aac(texto0)) %>% 
  ungroup()
 
df_word <- df %>% 
  mutate(treattext=texto1) %>% 
    unnest_tokens(uso, texto1, token = stringr::str_split, pattern = ";") %>%
  mutate(id_uso = row_number()) %>% 
  unnest_tokens(word, uso,  token = "words")  %>%
  anti_join(spanish_stop_words) %>% 
  mutate(consonantes=consonantes <- sapply(word, tiene_mas_de_4_consonantes_consecutivas)) %>% 
  mutate(Char=nchar(word)) %>% 
  filter(Char>3 & Char<24 ) %>% 
  mutate(newid=newid<-paste(usuario_id,id_uso, sep="_")) %>% 
  mutate(word=ifelse(consonantes==1,"",word)) %>% 
  mutate(id_uso=ifelse(consonantes==1,"",id_uso)) %>% 
  mutate(newid=ifelse(consonantes==1,"",newid)) %>% 
  select(-Char)

df_word2<- df_word[!duplicated(df_word$newid),]

df_word2<-df_word2 %>% 
  filter(consonantes==0) %>% 
  group_by(usuario_id) %>% 
  mutate(creativityf=n()) %>% 
  ungroup()

df_word4<-df_word2[!duplicated(df_word2$usuario_id),]

df_word4<-df_word4 %>% 
  select(usuario_id, study, privacy, dropout, rope1, creativityf)

#Rope 2:
df<- read_dta(path)

df<-df %>% 
  filter(is.na(usuario_id)==F) %>%
  filter(is.na(rope2)==F) %>% 
  group_by(usuario_id) %>% 
  mutate(texto0 = rope2) %>% 
  mutate(texto1 = limpiar_aac(texto0)) %>% 
  ungroup()

df_word <- df %>% 
  mutate(treattext=texto1) %>% 
  unnest_tokens(uso, texto1, token = stringr::str_split, pattern = ";") %>%
  mutate(id_uso = row_number()) %>% 
  unnest_tokens(word, uso,  token = "words")  %>%
  anti_join(spanish_stop_words) %>% 
  mutate(consonantes=consonantes <- sapply(word, tiene_mas_de_4_consonantes_consecutivas)) %>% 
  mutate(Char=nchar(word)) %>% 
  filter(Char>3 & Char<24 ) %>% 
  mutate(newid=newid<-paste(usuario_id,id_uso, sep="_")) %>% 
  mutate(word=ifelse(consonantes==1,"",word)) %>% 
  mutate(id_uso=ifelse(consonantes==1,"",id_uso)) %>% 
  mutate(newid=ifelse(consonantes==1,"",newid)) %>% 
  select(-Char)

df_word2<- df_word[!duplicated(df_word$newid),]

df_word2<-df_word2 %>% 
  filter(consonantes==0) %>% 
  group_by(usuario_id) %>% 
  mutate(creativityf=n()) %>% 
  ungroup() 

df_word5<-df_word2[!duplicated(df_word2$usuario_id),]

df_word5<-df_word5 %>% 
  select(usuario_id, study, privacy, dropout, rope2, creativityf)

```
#### Comentarios
##### Merging Datasets: The code combines the processed datasets "Ladrillo," "Rope1," and "Rope2" into a single dataset named "df_todas" using the "usuario_id" as the common identifier. This merged dataset is then joined with the original dataset "df" using the "usuario_id."

##### Data Cleansing: The code cleans the final dataset by handling missing values and converting the "creativityf" variable to the appropriate data type. The code also writes the cleaned dataset to an output file.
```ruby
{r}
df_todas<- merge(x = df_word3, y = df_word4, all=TRUE)
df_todas<- merge(x = df_todas, y = df_word5, all=TRUE)
df_todas<-df_todas %>% 
  select(usuario_id, creativityf)
df_final<- merge(x = df, y=df_todas, all=TRUE)

df_final<-df_final %>% 
  select(-texto0,-texto1)

df_final<-df_final %>% 
  mutate(creativityf=ifelse(privacy==0,".",creativityf))

df_final<-df_final %>% 
  mutate(creativityf=ifelse(is.na(creativityf)==T,0,creativityf))

write_dta(df_final,"C://D//creativityf_22112023.dta")

#The variable "creativityf" is saved as a string. For its use in Stata: destring creativityf, replace
```
