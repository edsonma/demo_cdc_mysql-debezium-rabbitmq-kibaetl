FROM rabbitmq:3.11.9-management

COPY docker/rabbitmq/rabbitmq.conf /etc/rabbitmq/rabbitmq.conf
COPY docker/rabbitmq/definitions.json /etc/rabbitmq/definitions.json
COPY docker/rabbitmq/enabled_plugins /etc/rabbitmq/enabled_plugins
COPY docker/rabbitmq/rabbitmq_delayed_message_exchange-3.11.1.ez /plugins/rabbitmq_delayed_message_exchange-3.11.1.ez
