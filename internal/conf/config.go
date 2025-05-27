package conf

type Database struct {
	Username string `mapstructure:"username"`
	Password string `mapstructure:"password"`
	Url      string `mapstructure:"url"`
	Port     string `mapstructure:"port"`
	Database string `mapstructure:"database"`
}
type Config struct {
	Database Database `mapstructure:"database"`
}

func DefaultConfig() *Config {
	return &Config{
		Database: Database{
			Username: "root",
			Password: "",
			Url:      "127.0.0.1",
			Port:     "3306",
			Database: "test_db",
		},
	}
}
