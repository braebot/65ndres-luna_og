# LUNA OG

Luna OG is a Rails application that uses the delayed_job gem to fetch the meta data
needed to preview the urls og tags.


to get started and one in the projects folder run:
```
> bundle install
> rails db:prepare
```

To get the jobs running open a new tab and once inside the projects folder run:
```
> bundle exec rake jobs:work
```

## Delayed Job vs Sidekiq
The most significant architectural decision was choosing the right tool for processing asynchronous jobs. Under normal circumstances, I would have opted for Sidekiq due to its performance and long-term maintainability compared to Delayed Job. However, the instructions mentioned that the team at Luna uses PostgreSQL. To streamline testing and reduce complexity, I decided to use Delayed Job, ensuring a smoother integration and avoiding unnecessary additional steps.